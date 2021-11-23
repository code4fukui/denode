FROM denoland/deno:1.16.2

USER root
RUN apt-get update
RUN apt-get install -y nodejs
#RUN apt-get install -y npm

WORKDIR /app
ADD . .

USER deno
CMD ["run", "-A", "fordeno.js"]
