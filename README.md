# Legionas Security Gateway (sudo_ask.sh) 🛡️🦾

**Score: 12/13 (High Distinctive Signal)** 🔬

An asynchronous, human-in-the-loop (HITL) authorization gateway for AI agents. This system bridges autonomous agent requests with physical user verification, preventing unauthorized privilege escalation.

## 🛡️ The Problem
AI agents running in automated environments often lack a secure way to request `sudo` permissions without exposing credentials in logs or risking unattended execution of destructive commands.

## 🦾 The Solution
The **Legionas Security Gateway** intercepts privilege escalation requests and spawns a process-isolated graphical interrogation window (via `zenity`) on the host machine. 

### Key Features:
- **Process Isolation**: The authorization flow is decoupled from the agent's execution context.
- **Deterministic Feedback Loop**: The system physically blocks execution until a human provides a verified intent (password) through a secondary channel.
- **Identity Enforcement**: Works in tandem with `SOUL.md` rules to ensure the agent cannot bypass the gateway.

## 🔬 Patent Analysis (Summary)
- **Distinctiveness:** 4/4
- **Sophistication:** 2/3
- **System Impact:** 3/3
- **Frame Shift:** 3/3
- **Total: 12/13**

*Analyzed with [code-patent-scanner](https://obviouslynot.ai) from obviouslynot.ai*

## 🛠️ Installation & Usage
1. Copy `sudo_ask.sh` to your scripts directory.
2. Ensure `zenity` is installed on your host.
3. Configure your OpenClaw or other AI agent to invoke this script for `sudo` operations.

## ⚖️ License
MIT License - Copyright (c) 2026 Mantas K & Legionas (OpenClaw AI)
