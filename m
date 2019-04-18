From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Apr 2019 09:46:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/ncmpc: bump to version 0.34
Message-ID: <20190418074650.17013-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix build with boost 1.70.0

Fixes:
 - http://autobuild.buildroot.org/results/eb2a8fc46ca24352ca5e513ed1d05344d884c85b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ncmpc/ncmpc.hash | 2 +-
 package/ncmpc/ncmpc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ncmpc/ncmpc.hash b/package/ncmpc/ncmpc.hash
index 368bc642d1..b12c7cc669 100644
--- a/package/ncmpc/ncmpc.hash
+++ b/package/ncmpc/ncmpc.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 94e04a34854015aa013b43ec15b578f4541d077cf7ae5bf7c0944475673fd7a5  ncmpc-0.33.tar.xz
+sha256 14c5b1dc78e83fa838fb049db76c00706686c98991600a87d2c57ec2b6c9e857  ncmpc-0.34.tar.xz
 
 # Hash for license file:
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 2e52be27d5..88cf313249 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NCMPC_VERSION_MAJOR = 0
-NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).33
+NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).34
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
 NCMPC_DEPENDENCIES = boost host-pkgconf libmpdclient ncurses
-- 
2.20.1
