From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Mar 2015 17:29:40 -0300
Subject: [Buildroot] [PATCH 1/2] libtasn1: bump to version 4.3
Message-ID: <1426019381-16061-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libtasn1/libtasn1.hash | 2 ++
 package/libtasn1/libtasn1.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/libtasn1/libtasn1.hash

diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
new file mode 100644
index 0000000..704cb66
--- /dev/null
+++ b/package/libtasn1/libtasn1.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	733513e3ffb03bd4910f97ef2683e602b40501428e4eb7649e325c2f4b1756cc	libtasn1-4.3.tar.gz
diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index bccbdf3..2fac0f7 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTASN1_VERSION = 4.2
+LIBTASN1_VERSION = 4.3
 LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
 LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.0.5
