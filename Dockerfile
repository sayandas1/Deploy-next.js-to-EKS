# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Install dependencies
COPY ./nextjs-material-kit-main/package*.json ./
RUN npm install

# Copy the local code into the container
COPY ./nextjs-material-kit-main .

# Build the Next.js application
RUN npm run build

# Expose the port Next.js is listening on
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]
