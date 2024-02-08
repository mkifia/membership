# Stage 1: Build the Angular application
FROM node:20.10-alpine AS build

RUN npm install --global nx@latest

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY ./front/package*.json /usr/src/app/

# Install dependencies
RUN npm install

RUN pwd

# Copy project files
COPY ./front /usr/src/app/

RUN ls -la
RUN pwd

# Build the app
RUN nx build

# Stage 2: Serve the app with Node.js
FROM node:20.10-alpine

RUN npm install --global nx@latest

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# Copy the build output from the previous stage
COPY --from=build /usr/src/app/dist /usr/src/app/dist

# Expose the port the app runs on
EXPOSE 4200

# Serve the app
CMD ["nx", "serve", "membership", "--host", "0.0.0.0", "--port", "4200"]
