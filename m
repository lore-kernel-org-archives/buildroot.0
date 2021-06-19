From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 19 Jun 2021 19:21:48 +0200
Subject: [Buildroot] [PATCH 2/2] package/libndp: bump to version 1.8
In-Reply-To: <20210619172148.295788-1-fontaine.fabrice@gmail.com>
References: <20210619172148.295788-1-fontaine.fabrice@gmail.com>
Message-ID: <20210619172148.295788-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libndp/libndp.hash | 4 ++--
 package/libndp/libndp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libndp/libndp.hash b/package/libndp/libndp.hash
index 8d4b6ef524..389e0ba5fc 100644
--- a/package/libndp/libndp.hash
+++ b/package/libndp/libndp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 44be73630ee785ed9f571f9aaaeba0e1d375fa337fd841270034c813b5b0e6fd  libndp-1.7.tar.gz
-sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  c3ea76e253def89869651686a827da75b56896fe94fabd87d8c14b1d4588fd05  libndp-1.8.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index eb1f7f0c80..db1de7b81c 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = 1.7
+LIBNDP_VERSION = 1.8
 LIBNDP_SITE = $(call github,jpirko,libndp,v$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPL-2.1+
 LIBNDP_LICENSE_FILES = COPYING
-- 
2.30.2
