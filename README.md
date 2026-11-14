# CertificateOwl

Proof of concept (March 2023, archived): issue PDF certificates in bulk from a CSV of recipients. Each certificate gets a public link, a QR code that points to it, and a "verify certificate" page where anyone can check a certificate number.

Rails 7.0, Ruby 3.2, Tailwind, `wicked_pdf` for PDFs, `rqrcode` for QR codes.

## How it works

1. **Certificate templates** (`CertificateTemplate`) hold a design plus default text: recipient name, description, issue date, issuer. Two designs ship in `app/views/certificate_templates/templates/`; `db/seeds.rb` creates the matching records.
2. **Groups** (`Group`) are one batch of certificates that share a template, for example one course cohort.
3. **CSV import** into a group creates one certificate per row. The file is semicolon-separated with headers:

   ```
   name;email;modifications.name;modifications.description;modifications.issued_at;modifications.issued_by
   ```

4. Each **certificate** gets a random hex slug, a QR code linking to `https://certificateowl.com/certificates/<slug>`, and a PDF at `/certificates/<slug>.pdf`.
5. **`/certificates/verify`** looks up a certificate number and says whether it exists.

Known gaps: `Certificate#send_email` builds the email but never calls `deliver_later`, so no email is sent; there are no accounts; expiry is a TODO.

## Product notes

These come from the first version of the idea, **vericerti** (Legal Hackathon 2022), which was deleted after this was written. Its code was superseded by this repo; these product ideas were not:

- **The pitch, as four steps:** pick a template → add your organization's name, logo and website → upload a recipient list → each recipient automatically gets a unique PDF certificate by email.
- **Issuer branding:** store the organization name, logo and website on each batch and render them on the certificate. This repo dropped that.
- **Digital seal / stamp:** "connect your own digital seal, or use ours." Pitched on the landing and pricing pages, never built. This is the most distinctive idea: a verifiable signature makes a certificate harder to fake than a QR link alone.
- **Pricing:**
  - €1 per certificate, pay as you go: free templates, digital seal, the certificate never expires.
  - €50/month: unlimited certificates, premium templates, teams. Certificates issued during the subscription stay valid after it ends.
- **A downloadable starter spreadsheet per template** (vericerti generated `.xlsx` files with the right column headers), so people upload a file in the right shape the first time.
- **Accounts:** vericerti had sign-up and sign-in, and certificates belonged to the user who issued them.
