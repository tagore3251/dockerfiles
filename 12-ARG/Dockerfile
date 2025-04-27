ARG version
# version-9 is default value,if you not provide the version during docker build time...
FROM almalinux:${version:-9} 
ENV name="Tagore" \
    course="DevOps"
#here user1 is key, someuser is default value
ARG USERNAME=Cherry
#set the ARG value to ENV variable inside Dockerfile then we can access ARG in inside container ENV variables
ENV USERNAME=$USERNAME
RUN echo "Hello User: ${USERNAME}, image version: ${version}" > /tmp/devops.txt
CMD ["sleep", "100"]