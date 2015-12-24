From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Dec 2015 15:27:15 +0100
Subject: [Buildroot] [git commit] libgdiplus: bump to version 4.2
Message-ID: <20151224142830.329AF7FE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7fed757456d30aae7be381f6a4aa463523ae1bb8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgdiplus/libgdiplus.hash | 2 +-
 package/libgdiplus/libgdiplus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
index 71ffdd3..f7fdcb5 100644
--- a/package/libgdiplus/libgdiplus.hash
+++ b/package/libgdiplus/libgdiplus.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 7eadc5105c6352d456c5f8699dc89260bf402e82ce6668e7e0c625519f9e5b44 libgdiplus-3.12.tar.gz
+sha256 98f8a8e58ed22e136c4ac6eaafbc860757f5a97901ecc0ea357e2b6e4cfa2be5 libgdiplus-4.2.tar.gz
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index fdb5b5c..aac859f 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGDIPLUS_VERSION = 3.12
+LIBGDIPLUS_VERSION = 4.2
 LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
 
 # Although there is a LICENSE file thas specifies LGPL or MPLv1.1,
