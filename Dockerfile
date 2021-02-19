FROM python:3
WORKDIR /root

# ansible and coverage module
RUN pip install ansible==2.10.4
RUN pip3 install coverage

# kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.14/bin/linux/amd64/kubectl
RUN chmod u+x kubectl && mv kubectl /bin/kubectl

# kustomize
RUN curl -LO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.8.7/kustomize_v3.8.7_linux_amd64.tar.gz && tar -xf kustomize_v3.8.7_linux_amd64.tar.gz && chmod +x kustomize && mv kustomize /usr/bin/kustomize && rm -rf kustomize_v3.8.7_linux_amd64.tar.gz

# kubeseal
RUN curl -LO https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.13.1/kubeseal-linux-amd64 && mv kubeseal-linux-amd64 kubeseal && chmod u+x kubeseal && mv kubeseal /bin/kubeseal

# flux
RUN curl -LO https://github.com/fluxcd/flux2/releases/download/v0.4.0/flux_0.4.0_linux_amd64.tar.gz && tar -xf flux_0.4.0_linux_amd64.tar.gz && chmod +x flux  && mv flux /bin/flux && rm -rf flux_0.4.0_linux_amd64.tar.gz


# aws-cli
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip -o awscliv2.zip && unzip awscliv2.zip && ./aws/install

# kops
RUN curl -LO https://github.com/kubernetes/kops/releases/download/v1.20.0-alpha.2/kops-linux-amd64 && mv kops-linux-amd64 kops && chmod +x kops && mv kops /usr/local/bin/kops


CMD [ "/bin/sh" ]