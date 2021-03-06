// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go knative.dev/pkg/apis/duck/v1

package v1

import (
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
)

// PodSpecable is implemented by types containing a PodTemplateSpec
// in the manner of ReplicaSet, Deployment, DaemonSet, StatefulSet.
#PodSpecable: corev1.#PodTemplateSpec

// WithPod is the shell that demonstrates how PodSpecable types wrap
// a PodSpec.
#WithPod: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     #WithPodSpec       @go(Spec)
}

// WithPodSpec is the shell around the PodSpecable within WithPod.
#WithPodSpec: {
	template?: #PodSpecable @go(Template)
}

// WithPodList is a list of WithPod resources
#WithPodList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)
	items: [...#WithPod] @go(Items,[]WithPod)
}

// Pod is a wrapper around Pod-like resource, which supports our interfaces
// for webhooks
#Pod: {
	metav1.#TypeMeta
	metadata?: metav1.#ObjectMeta @go(ObjectMeta)
	spec?:     corev1.#PodSpec    @go(Spec)
}

// PodList is a list of WithPod resources
#PodList: {
	metav1.#TypeMeta
	metadata: metav1.#ListMeta @go(ListMeta)
	items: [...#WithPod] @go(Items,[]WithPod)
}
