FROM java:8-jre-alpine
ADD timezone and default it to Shanghai
RUN apk --update add --no-cache tzdata
ENV TZ=Asia/Shanghai
RUN mkdir -p /app/log
COPY ./target/xxx.jar /app/xxx.jar
EXPOSE 9999
VOLUME ["/app/log"]
WORKDIR /app/
ENTRYPOINT ["java","-Xms2048m", "-Xmx2048m", "-Xss512k", "-jar","xxx.jar"]
CMD []