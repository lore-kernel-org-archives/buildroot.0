From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Oct 2014 14:09:05 -0300
Subject: [Buildroot] [PATCH] dropbear: bump to version 2014.66
Message-ID: <1414084145-23871-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dropbear/dropbear.hash | 2 ++
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/dropbear/dropbear.hash

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
new file mode 100644
index 0000000..f7042c3
--- /dev/null
+++ b/package/dropbear/dropbear.hash
@@ -0,0 +1,2 @@
+# From https://matt.ucc.asn.au/dropbear/releases/SHA1SUM.asc
+sha1	793f5f1bb465b3c55e795d607932e8b21c130e95	dropbear-2014.66.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 24f879c..d5a3509 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2014.65
+DROPBEAR_VERSION = 2014.66
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_TARGET_BINS = dbclient dropbearkey dropbearconvert scp ssh
-- 
2.0.4
