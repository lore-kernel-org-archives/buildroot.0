From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat,  5 Mar 2016 17:11:26 +0100
Subject: [Buildroot] [PATCH] package/monit: bump to version 5.17
Message-ID: <1457194286-11115-1-git-send-email-joerg.krause@embedded.rocks>
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
index 3724490..04f8790 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,2 +1,2 @@
-# From https://mmonit.com/monit/dist/monit-5.12.2.tar.gz.sha256:
-sha256	8ab0296d1aa2351b1573481592d7b5e06de1edd49dff1b5552839605a450914c  monit-5.12.2.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.17.tar.gz.sha256:
+sha256  2fbcdea79ae39228791a0aaa685ebbf650f2b58d086eaf77a33226e972cb216e  monit-5.17.tar.gz
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 9f0a29a..1d5904b 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.12.2
+MONIT_VERSION = 5.17
 MONIT_SITE = http://mmonit.com/monit/dist
 MONIT_LICENSE = AGPLv3 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
-- 
2.7.2
