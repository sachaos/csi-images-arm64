FROM arm64v8/alpine

ARG binary

COPY ${binary} ${binary}
RUN mv ${binary} app
ENTRYPOINT ["/app"]
