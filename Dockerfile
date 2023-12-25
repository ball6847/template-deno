FROM denoland/deno:alpine-1.39.1

ENV DENO_ENV production
ENV PORT 3000

WORKDIR /app

COPY . /app

RUN deno task cache && \
	deno task lint && \
	chown -R deno:deno . $DENO_DIR

USER deno

EXPOSE 3000
CMD [ "deno", "task", "start" ]
