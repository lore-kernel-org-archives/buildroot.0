From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Oct 2019 23:26:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/gqrx: bump version to 2.11.5
Message-ID: <20191020212644.1522-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gqrx/gqrx.hash | 2 +-
 package/gqrx/gqrx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gqrx/gqrx.hash b/package/gqrx/gqrx.hash
index 78df7f05be..77c34a8811 100644
--- a/package/gqrx/gqrx.hash
+++ b/package/gqrx/gqrx.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256 c4e836c552dc99bf383ca84b2ddc0c67e3d05b073676318e2a011bcd463303ef  gqrx-2.11.4.tar.gz
+sha256 5a15d8eb863f68a8590d27ebb2f50e735e814b1651de86952a7e425a68476d9d  gqrx-2.11.5.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256 7cc22ce5ee61df62e427ec43b8130de149edee3cafb5af4f18d59b6dc3958faf  LICENSE-CTK
diff --git a/package/gqrx/gqrx.mk b/package/gqrx/gqrx.mk
index e70d349cdc..c217aa7f18 100644
--- a/package/gqrx/gqrx.mk
+++ b/package/gqrx/gqrx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GQRX_VERSION = 2.11.4
+GQRX_VERSION = 2.11.5
 GQRX_SITE = $(call github,csete,gqrx,v$(GQRX_VERSION))
 GQRX_LICENSE = GPL-3.0+, Apache-2.0
 GQRX_LICENSE_FILES = COPYING LICENSE-CTK
-- 
2.20.1
