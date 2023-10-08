
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.17
# Create app directory
WORKDIR /app
# Copy source code to app directory
COPY package.json ./
# Install app dependencies
RUN npm install 
# Copy source code to app directory
COPY . . 
# Run testing
RUN npm run test
# Delete innesary files
RUN rm -rf tests &&  rm -rf node_modules
# Install app dependencies for production
RUN npm install --prod
# Command to run the app
CMD [ "node", "app.js" ]
