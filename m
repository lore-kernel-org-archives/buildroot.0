From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue,  9 Feb 2016 14:46:32 +0100
Subject: [Buildroot] [PATCH] package/monit: bump to version 5.16.1
Message-ID: <1455025592-25755-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/monit/monit.hash | 4 ++--
 package/monit/monit.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 3724490..5d527c2 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,2 +1,2 @@
-# From https://mmonit.com/monit/dist/monit-5.12.2.tar.gz.sha256:
-sha256	8ab0296d1aa2351b1573481592d7b5e06de1edd49dff1b5552839605a450914c  monit-5.12.2.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.16.1.tar.gz.sha256:
+sha256	b729b8345f5b85311c7f05751fc5d009128fd4a95fc4929a04b43bd15ab3b23f  monit-5.16.1.tar.gz
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 9f0a29a..0843ee5 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.12.2
+MONIT_VERSION = 5.16.1
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
-- 
2.7.1
