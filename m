From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Oct 2014 08:11:45 -0300
Subject: [Buildroot] [PATCH] openssh: bump to version 6.7p1
Message-ID: <1412680305-28778-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/openssh.hash | 2 ++
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/openssh/openssh.hash

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
new file mode 100644
index 0000000..0b57d48
--- /dev/null
+++ b/package/openssh/openssh.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	b2f8394eae858dabbdef7dac10b99aec00c95462753e80342e530bbb6f725507	openssh-6.7p1.tar.gz
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b934722..17097d5 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 6.6p1
+OPENSSH_VERSION = 6.7p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-- 
2.0.4
