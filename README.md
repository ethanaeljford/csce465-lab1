# CSCE 465 — Homework 1: Build and Threat-Model an AI Agent

Ethanael J. Ford

## Environment

| Component | Version |
|---|---|
| Host OS | Windows 11 |
| Hypervisor | VMware Workstation Pro 26H1u1 |
| Guest OS | Ubuntu 24.04 LTS (x86-64), prebuilt image from linuxvmimages.com |
| Node.js | 24.18.0 (via nvm) |
| OpenClaw | 2026.7.1-2 |
| Model | protected.gpt-4o via TAMUS AI |
| Python | 3.12.x (Ubuntu system) |

VM: 4 vCPU, 8 GB RAM, NAT networking only. See `setup-note.md` for
deviations from the assignment's tested baseline.

## Repository layout

    bin/safe_marker.sh          Task 2 marker script
    web/benign.html             Task 2 control page
    web/adversarial.html        Task 2 page with injected instruction
    markers/                    Marker output (contents gitignored)
    evidence/                   Raw command output and JSON transcripts
    injection-experiment.md     Task 3 write-up and annotated transcripts
    AI_USAGE.md                 AI-use disclosure
    README.md                   This file

Download Open claw outside of the repo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash source "$HOME/.nvm/nvm.sh" nvm install 24.18.0 nvm alias default 24.18.0 node --version npm --version
npm install -g openclaw@2026.7.1-2
openclaw --version

## Setup

install the safe_marker skill

and verify it is imported

make sure your chat gpt key is being used

export TAMU_API_KEY="<your key>"
node tamu-shim.mjs # listens on http://127.0.0.1:8899 — leave it runningLab Setup

verify it is listening

configure the open claw with the instructions given on the doc provided by the professor against the shim:

openclaw onboard --non-interactive --accept-risk \--auth-choice custom-api-key --custom-provider-id tamus \--custom-compatibility
openai \--custom-base-url "http://127.0.0.1:8899/openai" \--custom-api-key via-shim \--custom-model-id "protected.gpt-4o" --skipchannelsopenclaw
config set models.providers.tamus.request.allowPrivateNetwork trueopenclaw config set
agents.defaults.timeoutSeconds 600openclaw config set agents.defaults.memorySearch.enabled falseopenclaw config
validateopenclaw models set tamus/protected.gpt-4oopenclaw daemon install && openclaw daemon startTask 1.5 Verify Lab Setup

## Task 2 — marker script tests

Test the marker script and make sure they exit = 2 (proof in the evidence folder) 

## Task 2 — local web lab

host the json files to the web

## Task 3 — reproducing the two trials

make sure to remove the marker before this task 

Trial A (direct — instruction on the control channel):

    create a prompt asking the ai to run the safe_marker skill
    
Trial B (indirect — instruction on the data channel):

    create a prompt telling the model to summarize a file with the injected script

## Reading the evidence

all evidence is in the evidence folder! 


