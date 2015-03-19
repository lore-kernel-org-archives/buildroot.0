From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 Mar 2015 10:29:14 -0300
Subject: [Buildroot] [PATCH 1/2] musl: bump to version 1.1.7
Message-ID: <1426771755-21261-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/musl/musl.hash | 4 ++--
 package/musl/musl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 3c67c8c..0e6a2f9 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	5a0160c55c540d5b90158617a57647f1b03209f58d9ee70dbce19d1115b4f1b4	musl-1.1.6.tar.gz
+# Locally calculated after checking pgp signature
+sha256	d8e0aae287ecf8aa6500d3ed4131f33d216a7857dc7649a89125ffca6bf91599	musl-1.1.7.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index ebe9c6b..86674ca 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.6
+MUSL_VERSION = 1.1.7
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.0.5
