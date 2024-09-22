# GitHub Actions Learning Chapter 3 

## Adding a `KUBECONFIG` file to your action
You can add this file as a secret into your repository, simply copy/paste the file. 

### Using the `KUBECONFIG` file and setting context 

```
- name: Set Kubeconfig 
  uses: azure/k8s-set-context@v3 
  with: 
    method: kubeconfig
    kubeconfig: ${{ secrets.KUBECONFIG }}
```