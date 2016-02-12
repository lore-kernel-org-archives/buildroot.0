From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Feb 2016 13:06:07 -0300
Subject: [Buildroot] [PATCH] nano: bump to version 2.5.2
Message-ID: <1455293167-8091-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nano/nano.hash | 2 +-
 package/nano/nano.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 8b45847..b7ddc50 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  e06fca01bf183f4d531aa65a28dffc0e2d10185239909eb3de797023f3453bde  nano-2.5.1.tar.gz
+sha256  89bd6ac5120880d2a95431d8bad22bf92c7ccbf10b8f1716d4ea062f3faeeb41  nano-2.5.2.tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 0fa9009..4d77ea4 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.5.1
+NANO_VERSION = 2.5.2
 NANO_SITE = $(BR2_GNU_MIRROR)/nano
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
-- 
2.4.10
