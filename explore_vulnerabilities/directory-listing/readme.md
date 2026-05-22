# Thiago Messias Santos - São Paulo, 22/05/2026

# 🔓 Directory Listing Vulnerability Lab

> A hands-on cybersecurity lab demonstrating how insecure web server configurations can expose sensitive data through *Directory Listing (Autoindex)*.

---

## 📌 Overview

This project simulates a real-world **Server Misconfiguration vulnerability**, where a web server unintentionally exposes internal files and directories.

When directory listing is enabled and no default index file exists (`index.html`, `index.php`, etc.), the server automatically renders a full directory tree — potentially leaking:

- 📂 Backup files  
- 🧾 Logs  
- 🗄️ Database dumps  
- 📄 Confidential documents  

This lab recreates that scenario in a controlled environment using **Node.js + Express**.

---

## ⚙️ Tech Stack

- Node.js (Express)
- serve-index (intentionally vulnerable)
- Docker & Docker Compose
- Kali Linux (for attack simulation)

---

Listening directories:

```bash
gobuster dir -u http://app:3000 -w /usr/share/dirb/wordlists/common.txt
```