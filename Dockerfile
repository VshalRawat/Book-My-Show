FROM node:18
WORKDIR /app

# First, check what files are available
RUN ls -la /app/

# Copy package files explicitly
COPY ./bookmyshow-app/package.json ./
COPY ./bookmyshow-app/package-lock.json ./

# Verify files were copied
RUN ls -la /app/

# Install dependencies
RUN npm install postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps
RUN npm install --legacy-peer-deps

# Copy all app files
COPY ./bookmyshow-app/ ./

# Environment variables
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=3000

EXPOSE 3000
CMD ["npm", "start"]
