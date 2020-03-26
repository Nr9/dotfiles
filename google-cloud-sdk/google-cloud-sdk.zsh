export GOOGLE_CLOUD_SDK=$HOME/.google-cloud-sdk

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$GOOGLE_CLOUD_SDK/path.zsh.inc" ]; then . "$GOOGLE_CLOUD_SDK/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$GOOGLE_CLOUD_SDK/completion.zsh.inc" ]; then . "$GOOGLE_CLOUD_SDK/completion.zsh.inc"; fi
