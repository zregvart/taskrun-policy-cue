module github.com/zregvart/taskrun-policy-cue

go 1.17

replace k8s.io/client-go => k8s.io/client-go v0.22.5

replace k8s.io/apimachinery => k8s.io/apimachinery v0.22.5

require (
	github.com/tektoncd/pipeline v0.34.1 // indirect
	k8s.io/api v0.23.5 // indirect
	k8s.io/apimachinery v0.23.5 // indirect
)
