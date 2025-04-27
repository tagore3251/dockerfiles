FROM almalinux:9
RUN dnf install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html  #Removing the existing .html file, before copying new file
COPY index.html /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]