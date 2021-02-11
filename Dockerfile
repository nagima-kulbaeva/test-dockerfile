FROM python:3

WORKDIR /root


COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

#kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.14/bin/linux/amd64/kubectl
RUN chmod u+x kubectl && mv kubectl /bin/kubectl

#kustomize v 3.8.7
RUN curl -LO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv3.8.7/kustomize_v3.8.7_linux_amd64.tar.gz
RUN tar -xf kustomize_v3.8.7_linux_amd64.tar.gz
RUN chmod +x kustomize && mv kustomize /usr/bin/kustomize && rm -rf kustomize_v3.8.7_linux_amd64.tar.gz


#kubeseal 0.1.13
RUN curl -LO https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.13.1/kubeseal-linux-amd64 && mv kubeseal-linux-amd64 kubeseal
RUN chmod u+x kubeseal && mv kubeseal /bin/kubeseal


#flux 0.4.0
RUN curl -LO https://github.com/fluxcd/flux2/releases/download/v0.4.0/flux_0.4.0_linux_amd64.tar.gz && tar -xf flux_0.4.0_linux_amd64.tar.gz
RUN chmod +x flux  && mv flux /bin/flux
RUN rm -rf flux_0.4.0_linux_amd64.tar.gz
RUN pip3 install coverage

#aws-cli2
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip -o awscliv2.zip
RUN unzip awscliv2.zip
RUN ./aws/install


RUN curl -LO https://github.com/kubernetes/kops/releases/download/v1.20.0-alpha.2/kops-linux-amd64 && mv kops-linux-amd64 kops
RUN chmod +x kops
RUN mv kops /usr/local/bin/kops



CMD [ "/bin/sh" ]

