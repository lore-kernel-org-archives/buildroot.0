From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Jan 2015 06:52:31 -0300
Subject: [Buildroot] [PATCH] musl: bump to version 1.1.6
Message-ID: <1421229151-30734-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/musl/musl.hash | 2 +-
 package/musl/musl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index caea71a..3c67c8c 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	352362b1724cc9740f4c3ce0fe02aae45e4de9809ea4ac961f31aedc11b87393	musl-1.1.5.tar.gz
+sha256	5a0160c55c540d5b90158617a57647f1b03209f58d9ee70dbce19d1115b4f1b4	musl-1.1.6.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 1f1af05..ebe9c6b 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.5
+MUSL_VERSION = 1.1.6
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.0.5
