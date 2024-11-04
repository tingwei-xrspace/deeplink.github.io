echo Start Uploading file...
aws s3 cp index.html s3://one-app-qa-s3-aiagent/static/deeplink/index.html
aws s3 cp public s3://one-app-qa-s3-aiagent/static/deeplink/public --recursive
echo Uploading file done!

echo Open the URL in the default web browser...
# Open the URL in the default web browser
open https://aiagent.qa.xrspace.io/deeplink/index.html