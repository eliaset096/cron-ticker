
# Dependencies
FROM node:19.2-alpine3.17 AS  deps
WORKDIR /app
COPY package.json ./
RUN npm install 

# Test
FROM node:19.2-alpine3.17 AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . . 
RUN npm run test

# Production dependencies
FROM node:19.2-alpine3.17 AS prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

# Runner App
FROM node:19.2-alpine3.17 AS runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks
CMD [ "node", "app.js" ]
