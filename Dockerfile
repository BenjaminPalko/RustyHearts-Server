FROM scottyhardy/docker-wine:stable-9.0-20240915

ARG SQL_ADDRESS
ARG SQL_ACCOUNT
ARG SQL_PASSWORD
ARG SERVER_PRIVATE_IP
ARG SERVER_PUBLIC_IP
ARG SERVER_NAME

WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && apt-get install golang-go xvfb -y

# Start display for headless wine
RUN Xvfb :0 -screen 0 1024x768x16 &
# Install wine dependencies
COPY ./wine.sh .
RUN ./wine.sh

# Build go program
COPY ./go.mod ./main.go ./
RUN go build && chmod +x ./main

# Copy deploy and replace values
COPY ./deploy ./deploy
COPY ./replace.sh .
RUN ./replace.sh "${SQL_ADDRESS}" "${SQL_ACCOUNT}" "${SQL_PASSWORD}" "${SERVER_PRIVATE_IP}" "${SERVER_PUBLIC_IP}" "${SERVER_NAME}"

CMD [ "./main" ]

