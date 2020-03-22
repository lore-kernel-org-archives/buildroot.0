From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 15:44:00 +0100
Subject: [Buildroot] [git commit] package/uacme: mention openssl crypto
 backend in description
Message-ID: <20200322143056.5177F8120E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7eacd41bba29859d73cc2c12d013d2ef7f7e2ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uacme supports OpenSSL as crypto backend since version 1.0.8.

Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uacme/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/uacme/Config.in b/package/uacme/Config.in
index ac59764e1a..ea9babfda7 100644
--- a/package/uacme/Config.in
+++ b/package/uacme/Config.in
@@ -6,9 +6,10 @@ config BR2_PACKAGE_UACME
 	help
 	  uacme is a client for the ACMEv2 protocol described in
 	  RFC8555, written in plain C code with minimal dependencies
-	  (libcurl and GnuTLS or mbedTLS). The ACMEv2 protocol allows
-	  a Certificate Authority (https://letsencrypt.org is a
-	  popular one) and an applicant to automate the process of
-	  verification and certificate issuance.
+	  (libcurl and either of GnuTLS, OpenSSL or mbedTLS). The
+	  ACMEv2 protocol allows a Certificate Authority
+	  (https://letsencrypt.org is a popular one) and an applicant
+	  to automate the process of verification and certificate
+	  issuance.
 
 	  https://github.com/ndilieto/uacme
