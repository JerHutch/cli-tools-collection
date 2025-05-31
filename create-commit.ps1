# create-commit.ps1
param (
    [float]$temp = 0.3,
    [string]$sys = "You are a helpful assistant that writes concise, clear git commit messages based on the changes described.",
    [string]$user = "Write a commit message based on these changes:",
    [string]$model
)

$llmArgs = @(
    "prompt", $user,
    "--system", $sys
)

if ($model) {
    $llmArgs += @("--model", $model)
}

& {
    "GIT STATUS:`n"
    git status
    "`nGIT DIFF:`n"
    git diff
} | llm @llmArgs
