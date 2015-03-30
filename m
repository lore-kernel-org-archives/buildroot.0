From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 08:27:13 -0300
Subject: [Buildroot] [PATCH] libtasn1: security bump to version 4.4
Message-ID: <1427714833-13457-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Corrects a two-byte stack overflow in asn1_der_decoding (no CVE
assigned yet).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libtasn1/libtasn1.hash | 2 +-
 package/libtasn1/libtasn1.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
index 704cb66..05a8633 100644
--- a/package/libtasn1/libtasn1.hash
+++ b/package/libtasn1/libtasn1.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	733513e3ffb03bd4910f97ef2683e602b40501428e4eb7649e325c2f4b1756cc	libtasn1-4.3.tar.gz
+sha256	f8349db1b4fe634105c77e11d26b2173e587827e86e1a489b5e38ffa822e0c5d	libtasn1-4.4.tar.gz
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index 2fac0f7..0ec74e8 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.3
+LIBTASN1_VERSION = 4.4
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.0.5
