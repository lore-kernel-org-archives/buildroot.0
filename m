From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  1 Jul 2015 07:44:32 -0300
Subject: [Buildroot] [PATCH] openssh: bump to version 6.9p1
Message-ID: <1435747472-5687-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 3af72ff..76d0be8 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-# Also from http://www.openssh.com/txt/release-6.8 (sha256 is base64 encoded)
-sha256	3ff64ce73ee124480b5bf767b9830d7d3c03bbcb6abe716b78f0192c37ce160e	openssh-6.8p1.tar.gz
+# Also from http://www.openssh.com/txt/release-6.9 (sha256 is base64 encoded)
+sha256	6e074df538f357d440be6cf93dc581a21f22d39e236f217fcd8eacbb6c896cfe	openssh-6.9p1.tar.gz
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 24af079..11a844e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 6.8p1
+OPENSSH_VERSION = 6.9p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3c BSD-2c Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
-- 
2.3.6
