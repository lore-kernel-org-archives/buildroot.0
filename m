From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 17 Nov 2020 21:16:58 +0100
Subject: [Buildroot] [PATCH/next 1/6] package/bctoolbox: bump to version
 4.4.8
Message-ID: <20201117201703.137790-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bctoolbox/bctoolbox.hash | 2 +-
 package/bctoolbox/bctoolbox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bctoolbox/bctoolbox.hash b/package/bctoolbox/bctoolbox.hash
index 7d64c32013..49c5a27ee1 100644
--- a/package/bctoolbox/bctoolbox.hash
+++ b/package/bctoolbox/bctoolbox.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d8501e3793c10abbf913759d7a0e5f6eb3140af6bacf5e2bdcd532049bde69c0  bctoolbox-4.3.1.tar.gz
+sha256  446b60e81a79b11e8212c44e312aeb0ce46e9ecf0269a35c492ecdca3e7428c3  bctoolbox-4.4.8.tar.gz
 sha256  849dd903d98f12a964466ccfbaf3a1de1f94ad0ebd49a59d12f8ce4506f9f647  COPYING
diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
index 230394970c..6183e828ac 100644
--- a/package/bctoolbox/bctoolbox.mk
+++ b/package/bctoolbox/bctoolbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCTOOLBOX_VERSION = 4.3.1
+BCTOOLBOX_VERSION = 4.4.8
 BCTOOLBOX_SITE = $(call github,BelledonneCommunications,bctoolbox,$(BCTOOLBOX_VERSION))
 BCTOOLBOX_LICENSE = GPL-2.0+
 BCTOOLBOX_LICENSE_FILES = COPYING
-- 
2.29.2
