# 🚀 CI/CD Pipeline for Deploying an HTML File to AWS S3

This project sets up a **CI/CD pipeline** using **GitHub Actions** to automatically deploy an `index.html` file to an **AWS S3 bucket** whenever code is pushed to the `main` branch.

## 📌 Features
- ✅ **Automated deployment** of `index.html` to AWS S3.
- ✅ **GitHub Actions** triggers the deployment on every push to `main`.
- ✅ **Secure authentication** using AWS credentials stored in **GitHub Secrets**.
- ✅ **No manual intervention** required after setup.

---

## 📂 Project Structure
github/ │ ├── workflows/ │ │ ├── deploy.yml # GitHub Actions workflow file │── index.html # Static HTML file to be deployed │── main.tf # Terraform configuration for S3 bucket (optional) │── README.md

---

## ⚙️ Setup Instructions

### **1️⃣ Create an AWS S3 Bucket**
1. **Go to AWS Console → S3**.
2. Click **"Create bucket"**.
3. Choose a **globally unique bucket name**, e.g., `my-static-site-bucket-123456789`.
4. **Disable "Block all public access"**.
5. **Enable "Static website hosting"** and set:
   - **Index document:** `index.html`
6. Click **Create Bucket**.

---

### **2️⃣ Configure S3 Bucket Policy**
To make objects publicly accessible, go to **AWS Console → S3 → Your Bucket → Permissions** and add this **bucket policy**:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::my-static-site-bucket-123456789/*"
    }
  ]
}
