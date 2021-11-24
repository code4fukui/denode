FROM node:17.1.0

USER node
RUN curl -fsSL https://deno.land/x/install/install.sh | sh -s v1.16.2

WORKDIR /app
ADD . .

CMD ["fornode.mjs"]
