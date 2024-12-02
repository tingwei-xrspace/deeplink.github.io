if [ -z "$1" ]; then
  echo "Usage: sh publish.sh [dev|qa|prod]"
  exit 1
fi

  FILE_PATH="deeplink/index.html";

# Set environment-specific variables
if [ "$1" = "dev" ]; then
  BUCKET="s3://one-app-develop-s3-aiagent/static/deeplink"
  DOMAIN="aiagent.dev.xrspace.io"
  TARGET_DIR="./dev"
elif [ "$1" = "qa" ]; then
  BUCKET="s3://one-app-qa-s3-deeplink/static/deeplink"
  DOMAIN="aiagent.qa.xrspace.io"
  TARGET_DIR="./qa"
elif [ "$1" = "prod" ]; then
  BUCKET="s3://one-app-prod-s3-deeplink/static/deeplink"
  DOMAIN="aiagent.xrspace.io"
  TARGET_DIR="./prod"
else
  echo "Invalid environment. Use 'dev' or 'qa' or 'prod'."
  exit 1
fi

URL="https://$DOMAIN/$FILE_PATH"

echo "Start Uploading file to $1 environment..."

# Push files to the specified S3 bucket
aws s3 cp "$TARGET_DIR/index.html" $BUCKET/index.html
aws s3 cp public $BUCKET/public --recursive

echo Uploading file done!

echo "Open the URL in the default web browser..."

echo "Direct to : $URL"
# Open the URL in the default web browser
open $URL