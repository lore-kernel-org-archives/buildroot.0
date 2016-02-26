From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 26 Feb 2016 13:39:58 -0300
Subject: [Buildroot] [PATCH] nano: bump to version 2.5.3
Message-ID: <1456504798-23269-1-git-send-email-gustavo@zacarias.com.ar>
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
index b7ddc50..eb6a9fc 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256  89bd6ac5120880d2a95431d8bad22bf92c7ccbf10b8f1716d4ea062f3faeeb41  nano-2.5.2.tar.gz
+sha256  b2b060129b9feff2d4870d803a441178c96531de9aed144ec0b83bd63ccb12ee  nano-2.5.3.tar.gz
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 4d77ea4..be6ea24 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANO_VERSION = 2.5.2
+NANO_VERSION = 2.5.3
 NANO_SITE = $(BR2_GNU_MIRROR)/nano
 NANO_LICENSE = GPLv3+
 NANO_LICENSE_FILES = COPYING
-- 
2.4.10
