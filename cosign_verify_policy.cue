package policy

import (
	tkn "github.com/tektoncd/pipeline/pkg/apis/pipeline/v1alpha1"
	"encoding/json"
)

// Make sure that input is a Tekton TaskRun
tkn.#TaskRun

// Also it should be a specific TaskRun
spec: {
	taskRef: {
		bundle: "quay.io/zregvart_redhat/appstudio-tasks:2022-03-22-130413-1"
		name:   "cosign-verify"
	}
}

// Pull out TaskRun.status
status: tkn.#TaskRunStatus

// Un-emitted (hidden) used only for checks
_checks: {
	// Declare a struct { ref: "<image reference>" }
	#param_image: {
		for p in spec.params if p.name == "IMAGE" {
			"ref": p.value
		}
	}

	// Check that the result references the image that was specified in the params
	// Since the status.taskResults[].value is a JSON string, we need to unmarshal it
	for r in status.taskResults if r.name == "VERIFY_JSON" {
		// The IMAGE parameter and the ..."docker-reference" need not be disjointed
		#param_image.ref & json.Unmarshal(r.value)[0].critical.identity."docker-reference"
	}
}
