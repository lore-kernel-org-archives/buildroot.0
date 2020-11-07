From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Nov 2020 15:06:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/fbtft: add license file
Message-ID: <20201107140626.169811-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fbtft/fbtft.hash | 1 +
 package/fbtft/fbtft.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/fbtft/fbtft.hash b/package/fbtft/fbtft.hash
index 894d9794a9..5d08d0ef85 100644
--- a/package/fbtft/fbtft.hash
+++ b/package/fbtft/fbtft.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  0e81de89fdd7ab810716fc0549e767527f342e829309dee5c2cca1e9d1728770  fbtft-274035404701245e7491c0c6471c5b72ade4d491.tar.gz
+sha256  a9ca80d65a5ef10fe614a6c1e8c8d4d3b96637e8855a96c7cf0fa438526097a7  fbtft-core.c
diff --git a/package/fbtft/fbtft.mk b/package/fbtft/fbtft.mk
index b935e741d5..cc11d867fc 100644
--- a/package/fbtft/fbtft.mk
+++ b/package/fbtft/fbtft.mk
@@ -7,5 +7,6 @@
 FBTFT_VERSION = 274035404701245e7491c0c6471c5b72ade4d491
 FBTFT_SITE = $(call github,notro,fbtft,$(FBTFT_VERSION))
 FBTFT_LICENSE = GPL-2.0
+FBTFT_LICENSE_FILES = fbtft-core.c
 
 $(eval $(generic-package))
-- 
2.28.0
