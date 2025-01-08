# Use an official lightweight Node.js runtime as a parent image
FROM node:18-alpine

# Replace the working directory if you are not using app in the container
WORKDIR /app

# Copy the package.json and package-lock.json (if available)
COPY package*.json ./

# Install  dependencies
RUN npm install

# Bundle app source inside the Docker image
COPY . .

# Then run npm
RUN npm run build

# Set environment to development or production depending of your requirements
ENV NODE_ENV=development
# ENV NODE_ENV=production

# Command to run the app
CMD ["npm", "start"]
