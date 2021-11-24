FROM node:17.1.0

USER node
RUN curl -fsSL https://deno.land/x/install/install.sh | sh
#RUN apt-get install -y npm

WORKDIR /app
ADD . .

CMD ["fornode.mjs"]
