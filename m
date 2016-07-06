From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  6 Jul 2016 23:13:42 +0200
Subject: [Buildroot] [PATCH] musl: bump to version 1.1.15
Message-ID: <1467839622-30542-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/musl.hash | 2 +-
 package/musl/musl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 907e9c6..8ef4def 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	35f6c00c84a6091bd5dab29eedde7508dae755ead92dcc0239f3677d1055b9b5  musl-1.1.14.tar.gz
+sha256	97e447c7ee2a7f613186ec54a93054fe15469fe34d7d323080f7ef38f5ecb0fa  musl-1.1.15.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 733f940..920bbbf 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.14
+MUSL_VERSION = 1.1.15
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
-- 
2.7.4
