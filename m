From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Sep 2019 19:17:41 +0200
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump to version 0.35
Message-ID: <20190930171741.30927-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/ncmpc.hash | 2 +-
 package/ncmpc/ncmpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index b12c7cc669..7bde99bfc9 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 14c5b1dc78e83fa838fb049db76c00706686c98991600a87d2c57ec2b6c9e857  ncmpc-0.34.tar.xz
+sha256 bd4f1e638290915e08be045087c1df2d562d012b14f662dd33fd7c7043ddd241  ncmpc-0.35.tar.xz
 
 # Hash for license file:
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index d2204c71c6..a8805c334c 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).34
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).35
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
-- 
2.23.0
