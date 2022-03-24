# Example of a policy check for a Tekton TaskRun using cue

Everything is setup here, to run the policy check use `run.sh`:

```shell
$ ./run.sh 
+ cue vet cosign_verify_policy.cue cosign-verify-f4f0c6c4cf0aadd55216.yaml
```

To ilustrate how the the project was setup look at the `setup.sh`.
