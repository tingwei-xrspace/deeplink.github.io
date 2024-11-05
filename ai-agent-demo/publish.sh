if [ -z "$1" ]; then
  echo "Usage: sh publish.sh [dev|qa]"
  exit 1
fi

# Set environment-specific variables
if [ "$1" = "dev" ]; then
  BUCKET="s3://one-app-develop-s3-aiagent/static/deeplink"
  URL="https://aiagent.dev.xrspace.io/deeplink/index.html"
  TARGET_DIR="./dev"
elif [ "$1" = "qa" ]; then
  BUCKET="s3://one-app-qa-s3-aiagent/static/deeplink"
  URL="https://aiagent.qa.xrspace.io/deeplink/index.html"
  TARGET_DIR="./qa"
else
  echo "Invalid environment. Use 'dev' or 'qa'."
  exit 1
fi

echo "Start Uploading file to $1 environment..."

# Push files to the specified S3 bucket
aws s3 cp "$TARGET_DIR/index.html" $BUCKET/index.html
aws s3 cp public $BUCKET/public --recursive


echo Uploading file done!

echo "Open the URL in the default web browser..."
# Open the URL in the default web browser
open $URL