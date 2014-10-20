From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 08:01:56 -0300
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.13
Message-ID: <1413802916-27390-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.hash | 2 ++
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/samba4/samba4.hash

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
new file mode 100644
index 0000000..b263bd8
--- /dev/null
+++ b/package/samba4/samba4.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	737907f4ed3a71f6ec12638387aff7cda4764f8c2eb18deeca16e2fb7ed66c9f	samba-4.1.13.tar.gz
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 0df267f..c4613f1 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.1.12
+SAMBA4_VERSION = 4.1.13
 SAMBA4_SITE = http://ftp.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_LICENSE = GPLv3+
-- 
2.0.4
