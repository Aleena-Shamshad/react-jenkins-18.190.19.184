# Use the official Node.js image as a base image
FROM node:21

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm install -g @angular/cli
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the Angular app
RUN ng build 

# Use the official Nginx image as a base image for the production server
FROM nginx:alpine

# Copy the build output to the Nginx HTML directory
COPY --from=0 /app/dist/angular-hello-world /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
