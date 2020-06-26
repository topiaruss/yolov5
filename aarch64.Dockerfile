FROM nvcr.io/nvidia/l4t-ml:r32.4.2-py3

MAINTAINER russ.ferriday@gmail.com


# We get opencv from the distro, because there is still ~no support 
# for opencv-python wheels for aarch64
RUN apt-get update && apt-get install -y python-opencv python3-opencv


# The base container contains an older pip3 version - let's confirm...
RUN pip3 -V
# It tells me 9.0.1 -- pretty old -- so, let's grab latest to 
#   help us diagnose any dependency issues. Perhaps this belongs 
#   in the base Dockerfile? @dusty_nv?
RUN sudo -H pip3 install --upgrade pip>=20.1.1


# Now get the additional python deps
RUN pip3 install \
  PyYAML>=5.3 \
  tqdm

# What do we have, so far?
RUN pip3 list