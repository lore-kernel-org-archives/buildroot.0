From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Jan 2020 19:58:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump to version 0.36
Message-ID: <20200103185812.2147736-1-fontaine.fabrice@gmail.com>
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
index 7bde99bfc9..2a8533a2ee 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 bd4f1e638290915e08be045087c1df2d562d012b14f662dd33fd7c7043ddd241  ncmpc-0.35.tar.xz
+sha256 4632873dfc8efe61e501dc9184a5b921b482be2ddbedd3d23d05241d477a3e2c  ncmpc-0.36.tar.xz
 
 # Hash for license file:
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index a8805c334c..86e3c8383f 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).35
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).36
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = \
-- 
2.24.0
