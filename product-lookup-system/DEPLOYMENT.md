# Deployment Guide (Frontend & Backend on Vercel)

This document summarises the steps required to deploy the application to Vercel. The repository is already prepared; follow the steps below for each project.

## Prerequisites

- Install the Vercel CLI: `npm i -g vercel`
- Log in: `vercel login`
- Ensure your MongoDB connection string and secrets are ready.

## Backend (Express API)

1. `cd product-lookup-system/server`
2. Add environment variables in Vercel:
   - `MONGO_URI`
   - `JWT_SECRET`
   - `ADMIN_PASSWORD`
   - (Optional) `PORT` (defaults to `5000` locally)
3. Deploy:
   - Preview: `vercel`
   - Production: `vercel --prod`
4. Copy the generated deployment URL (e.g., `https://your-backend.vercel.app`).

## Frontend (React client)

1. `cd product-lookup-system/client`
2. Set environment variable `REACT_APP_API_URL` in Vercel to the backend URL followed by `/api` (e.g., `https://your-backend.vercel.app/api`).
3. Deploy:
   - Preview: `vercel`
   - Production: `vercel --prod`

## Local Development

- Backend: `cd product-lookup-system/server && npm install && npm run dev`
- Frontend: `cd product-lookup-system/client && npm install && npm start`
- Update `client/.env` if you need a different local API URL.

## Notes

- The backend is serverless-friendly (uses cached MongoDB connections and exports an Express handler).
- The frontend automatically reads the API base URL from `process.env.REACT_APP_API_URL`.
- Update environment variables in Vercel whenever secrets change.
