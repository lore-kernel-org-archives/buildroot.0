From: sikor6 at gmail.com <sikor6@gmail.com>
Date: Tue, 21 Mar 2017 00:33:47 +0100
Subject: [Buildroot] [PATCH 1/3] xenomai: bump version to 3.0.3
Message-ID: <20170320233349.14057-1-sikor6@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Pawel Sikora <sikor6@gmail.com>

Signed-off-by: Pawel Sikora <sikor6@gmail.com>
---
 package/xenomai/xenomai.hash | 2 +-
 package/xenomai/xenomai.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index 4d74472ee..e41859343 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,2 @@
 # Locally computed;
-sha256  b6ff723cb0f3b1c2c4e15bccfd114b248dea1b4164a0ac0e612815379ce7caf8  xenomai-2.6.4.tar.bz2
+sha256  4c396b4d447efd414c4d7c0894f97ef52b4ec45c87f512c14adee981a45f0e3b  xenomai-3.0.3.tar.bz2
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 6e0e44163..28875b944 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 2.6.4
+XENOMAI_VERSION = 3.0.3
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif
-- 
2.12.0
