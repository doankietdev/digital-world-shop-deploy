# Digital World Shop Deployment

## Deployment Instructions

### 1. Create a `.env.redis` file for redis service with the following environment variables:

```dotenv
  PASSWORD=
```

### 2. Create a `.env.server` file for API service with the following environment variables:

```dotenv
  MONGODB_URI=
  DATABASE_NAME=digital_shop

  APP_HOST=
  APP_PORT=
  WHITELIST_DOMAINS= # Separated by ,

  BRAND_NAME=Digital Shop
  CLIENT_URL=
  CLIENT_OTP_FORM_PATH=/auth/verify-password-reset-otp/:userId/:email
  CLIENT_PAID_ORDERS_PATH=/user/purchase?status=PAID
  EMAIL_VERIFICATION_TOKEN_LIFE=15m
  ACCESS_TOKEN_LIFE=1h
  REFRESH_TOKEN_LIFE=60 days
  PASSWORD_RESET_OTP_LIFE=5m
  PASSWORD_RESET_TOKEN_LIFE=5m
  NEW_PASSWORD_NOT_SAME_OLD_PASSWORD_TIME=90 days
  MAX_SESSIONS=5

  EMAIL_APP_PASSWORD=
  EMAIL_NAME=

  CLOUDINARY_NAME=
  CLOUDINARY_API_KEY=
  CLOUDINARY_API_SECRET=

  GHN_TOKEN=
  GHN_SHOP_ID=

  PAYPAL_CLIENT_ID=
  PAYPAL_CLIENT_SECRET=

  GOOGLE_CLIENT_ID=
  GOOGLE_SECRET=

  CURRENCY_FREAKS_API_KEY=

  MOMO_PARTNER_CODE=
  MOMO_ACCESS_KEY=
  MOMO_SECRET_KEY=
  MOMO_ORDER_EXPIRE_TIME=30 # In minutes

  REDIS_HOST=redis
  REDIS_PORT=6379
  REDIS_USER=default
  REDIS_PASSWORD=

  AVATAR_MAX_SIZE=5242880 # In bytes
```

### 3. Create a `.env.reverse` for reverse proxy service file with the following environment variables:

```dotenv
  HOST_PORT=
```

### 4. Create a `.env.client` for front-end service file with the following environment variables:

```dotenv
  MY_APP_API_ROOT= # Point back to forward proxy + /api. Example: http:localhost/api
  MY_APP_GOOGLE_CLIENT_ID=
  MY_APP_MAX_AVATAR_SIZE=5242880 # In bytes
```

### 5. Run the following command:

```
  docker compose up -d
```
