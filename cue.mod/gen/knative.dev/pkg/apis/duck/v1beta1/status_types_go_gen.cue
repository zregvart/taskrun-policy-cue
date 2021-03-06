// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go knative.dev/pkg/apis/duck/v1beta1

package v1beta1

import (
	"knative.dev/pkg/apis"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// Conditions is a simple wrapper around apis.Conditions to implement duck.Implementable.
#Conditions: apis.#Conditions

// KResource is a skeleton type wrapping Conditions in the manner we expect
// resource writers defining compatible resources to embed it.  We will
// typically use this type to deserialize Conditions ObjectReferences and
// access the Conditions data.  This is not a real resource.
#KResource: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	status:    #Status            @go(Status)
}

// Status shows how we expect folks to embed Conditions in
// their Status field.
// WARNING: Adding fields to this struct will add them to all Knative resources.
#Status: {
	// ObservedGeneration is the 'Generation' of the Service that
	// was last processed by the controller.
	// +optional
	observedGeneration?: int64 @go(ObservedGeneration)

	// Conditions the latest available observations of a resource's current state.
	// +optional
	// +patchMergeKey=type
	// +patchStrategy=merge
	conditions?: #Conditions @go(Conditions)

	// Annotations is additional Status fields for the Resource to save some
	// additional State as well as convey more information to the user. This is
	// roughly akin to Annotations on any k8s resource, just the reconciler conveying
	// richer information outwards.
	annotations?: {[string]: string} @go(Annotations,map[string]string)
}

// KResourceList is a list of KResource resources
#KResourceList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)
	items: [...#KResource] @go(Items,[]KResource)
}
