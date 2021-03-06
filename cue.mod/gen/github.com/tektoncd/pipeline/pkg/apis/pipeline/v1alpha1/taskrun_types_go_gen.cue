// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/tektoncd/pipeline/pkg/apis/pipeline/v1alpha1

package v1alpha1

import (
	"github.com/tektoncd/pipeline/pkg/apis/pipeline/v1beta1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"github.com/tektoncd/pipeline/pkg/apis/pipeline/pod"
)

// TaskRunSpec defines the desired state of TaskRun
#TaskRunSpec: {
	// +optional
	serviceAccountName: string @go(ServiceAccountName)

	// no more than one of the TaskRef and TaskSpec may be specified.
	// +optional
	taskRef?: null | v1beta1.#TaskRef @go(TaskRef,*v1beta1.TaskRef)

	// +optional
	taskSpec?: null | #TaskSpec @go(TaskSpec,*TaskSpec)

	// Used for cancelling a taskrun (and maybe more later on)
	// +optional
	status?: v1beta1.#TaskRunSpecStatus @go(Status)

	// Time after which the build times out. Defaults to 10 minutes.
	// Specified build timeout should be less than 24h.
	// Refer Go's ParseDuration documentation for expected format: https://golang.org/pkg/time/#ParseDuration
	// +optional
	timeout?: null | metav1.#Duration @go(Timeout,*metav1.Duration)

	// PodTemplate holds pod specific configuration
	// +optional
	podTemplate?: null | pod.#Template @go(PodTemplate,*github.com/tektoncd/pipeline/pkg/apis/pipeline/pod.Template)

	// Workspaces is a list of WorkspaceBindings from volumes to workspaces.
	// +optional
	workspaces?: [...v1beta1.#WorkspaceBinding] @go(Workspaces,[]v1beta1.WorkspaceBinding)

	// From v1beta1
	// +optional
	params?: [...v1beta1.#Param] @go(Params,[]v1beta1.Param)

	// +optional
	resources?: null | v1beta1.#TaskRunResources @go(Resources,*v1beta1.TaskRunResources)

	// Deprecated
	// +optional
	inputs?: null | #TaskRunInputs @go(Inputs,*TaskRunInputs)

	// +optional
	outputs?: null | #TaskRunOutputs @go(Outputs,*TaskRunOutputs)
}

// TaskRunSpecStatus defines the taskrun spec status the user can provide
#TaskRunSpecStatus: v1beta1.#TaskRunSpecStatus

// TaskRunSpecStatusCancelled indicates that the user wants to cancel the task,
// if not already cancelled or terminated
#TaskRunSpecStatusCancelled: "TaskRunCancelled"

// TaskRunReasonCancelled indicates that the TaskRun has been cancelled
// because it was requested so by the user
#TaskRunReasonCancelled: "TaskRunCancelled"

// TaskRunInputs holds the input values that this task was invoked with.
#TaskRunInputs: {
	// +optional
	resources?: [...v1beta1.#TaskResourceBinding] @go(Resources,[]v1beta1.TaskResourceBinding)

	// +optional
	params?: [...v1beta1.#Param] @go(Params,[]v1beta1.Param)
}

// TaskResourceBinding points to the PipelineResource that
// will be used for the Task input or output called Name.
#TaskResourceBinding: v1beta1.#TaskResourceBinding

// TaskRunOutputs holds the output values that this task was invoked with.
#TaskRunOutputs: {
	// +optional
	resources?: [...v1beta1.#TaskResourceBinding] @go(Resources,[]v1beta1.TaskResourceBinding)
}

// TaskRunStatus defines the observed state of TaskRun
#TaskRunStatus: v1beta1.#TaskRunStatus

// TaskRunStatusFields holds the fields of TaskRun's status.  This is defined
// separately and inlined so that other types can readily consume these fields
// via duck typing.
#TaskRunStatusFields: v1beta1.#TaskRunStatusFields

// TaskRunResult used to describe the results of a task
#TaskRunResult: v1beta1.#TaskRunResult

// StepState reports the results of running a step in the Task.
#StepState: v1beta1.#StepState

// SidecarState reports the results of sidecar in the Task.
#SidecarState: v1beta1.#SidecarState

// CloudEventDelivery is the target of a cloud event along with the state of
// delivery.
#CloudEventDelivery: v1beta1.#CloudEventDelivery

// CloudEventCondition is a string that represents the condition of the event.
#CloudEventCondition: v1beta1.#CloudEventCondition // #enumCloudEventCondition

#enumCloudEventCondition:
	#CloudEventConditionUnknown |
	#CloudEventConditionSent |
	#CloudEventConditionFailed

// CloudEventConditionUnknown means that the condition for the event to be
// triggered was not met yet, or we don't know the state yet.
#CloudEventConditionUnknown: v1beta1.#CloudEventCondition & "Unknown"

// CloudEventConditionSent means that the event was sent successfully
#CloudEventConditionSent: v1beta1.#CloudEventCondition & "Sent"

// CloudEventConditionFailed means that there was one or more attempts to
// send the event, and none was successful so far.
#CloudEventConditionFailed: v1beta1.#CloudEventCondition & "Failed"

// CloudEventDeliveryState reports the state of a cloud event to be sent.
#CloudEventDeliveryState: v1beta1.#CloudEventDeliveryState

// TaskRun represents a single execution of a Task. TaskRuns are how the steps
// specified in a Task are executed; they specify the parameters and resources
// used to run the steps in a Task.
//
// +k8s:openapi-gen=true
#TaskRun: {
	metav1.#TypeMeta

	// +optional
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)

	// +optional
	spec?: #TaskRunSpec @go(Spec)

	// +optional
	status?: v1beta1.#TaskRunStatus @go(Status)
}

// TaskRunList contains a list of TaskRun
#TaskRunList: {
	metav1.#TypeMeta

	// +optional
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#TaskRun] @go(Items,[]TaskRun)
}
