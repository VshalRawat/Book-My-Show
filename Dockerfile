FROM node:18
WORKDIR /app

# Copy dependency files from the app folder
COPY bookmyshow-app/package*.json ./

# Install dependencies
RUN npm install postcss@8.4.21 postcss-safe-parser@6.0.0 --legacy-peer-deps
RUN npm install

# Copy all application files
COPY bookmyshow-app/ ./

# Set environment variables
ENV NODE_OPTIONS=--openssl-legacy-provider
ENV PORT=3000

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
