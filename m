From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 May 2017 20:52:57 +0200
Subject: [Buildroot] [PATCH/next 1/2] package/libva: bump version to 1.8.2
Message-ID: <20170522185258.13202-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 4 ++--
 package/libva/libva.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 059042353..875a4d196 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,4 +1,4 @@
 # From https://github.com/01org/libva/releases
-sha1 ae1f580d3ca54199393133214ac1e5a66d9cbeb3  libva-1.8.1.tar.bz2
+sha1 7c4253c97f5e1e76500ff75321287131941494bc  libva-1.8.2.tar.bz2
 # Locally computed
-sha256 c1d5d85b6b40b76f37993b4da33388d3d73b64998dcbc160b7578e24ed775c73  libva-1.8.1.tar.bz2
+sha256 9ed3e3ddc8f47a715d4c6ec366beb21c83fc4e8a3d4d39a811baff76f0a0cede  libva-1.8.2.tar.bz2
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index ffd990fab..b89d5fa27 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 1.8.1
+LIBVA_VERSION = 1.8.2
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/01org/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
-- 
2.11.0
