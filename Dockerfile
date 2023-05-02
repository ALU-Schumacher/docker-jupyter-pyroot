# This will install:
# - AlmaLinux 9
# - Jupyter 
# - ROOT

# To see the version numbers (which change as the EPEL and PyPI repositories evolve)
# start the Terminal from the Jupyter notebook and type (e.g.):

# rpm -q root
# pip3 show jupyter

FROM almalinux:9

WORKDIR /work

# Install packages from AlmaLinux base and EPEL
RUN dnf -y install 'dnf-command(config-manager)'  \
    && dnf config-manager --set-enabled crb       \
    && dnf -y install epel-release                \
    && dnf -y update                              \
    # Install packages needed for ROOT
    && dnf -y install python3 python3-pip root which python3-root python3-devel \
    && dnf -y install root-tmva root-tmva-python root-minuit2 python3-jupyroot  \
    # curl will be needed when we install python packages below.
    && dnf -y install curl libcurl libcurl-devel --allowerasing    \
    # Additional packages for some C++ work:
    && dnf -y install make boost-devel gsl-devel binutils-devel    \
    # Other Linux packages required for python package compilation.
    && dnf yum -y install python3-pillow-devel openssl-devel       \
    # Install packages from PyPI. These are the ones needed for almost any
    # Jupyter installation.
    && pip3 install --upgrade wheel jupyter numpy scipy matplotlib \
    # These additional packages are handy, but not critical.
    && pip3 install --upgrade jupyterlab iminuit pandas sympy terminado urllib3 tables rootpy rootkernel uproot \
    # Clean up
    && dnf clean all \
    && rm -rf /var/cache/yum

# Run jupyter when this docker container is started.
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8080", "--allow-root"]
