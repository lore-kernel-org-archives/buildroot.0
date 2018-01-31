From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 31 Jan 2018 20:25:22 +0100
Subject: [Buildroot] [PATCH] autofs: update to 5.1.4
Message-ID: <20180131192522.GA19569@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/autofs/autofs.hash | 2 +-
 package/autofs/autofs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/autofs/autofs.hash b/package/autofs/autofs.hash
index 61e5882..1f2060b 100644
--- a/package/autofs/autofs.hash
+++ b/package/autofs/autofs.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/daemons/autofs/v5/sha256sums.asc
-sha256 e96eebfe3ed5fb1a30f4510f538198affde223e370c6dc2bed9780309272b1bf  autofs-5.1.3.tar.xz
+sha256 8fce30ee51ffd528fe1a4e8374ef57f43367e1f123030e175fb1b1cf15bc1722  autofs-5.1.4.tar.xz
diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
index 148ab1b..90cc38d 100644
--- a/package/autofs/autofs.mk
+++ b/package/autofs/autofs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOFS_VERSION = 5.1.3
+AUTOFS_VERSION = 5.1.4
 AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
 AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
 AUTOFS_LICENSE = GPL-2.0+
-- 
2.1.4
