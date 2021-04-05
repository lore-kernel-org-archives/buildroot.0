From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  5 Apr 2021 15:08:06 +0200
Subject: [Buildroot] [PATCH] package/enchant: bump to version 2.2.15
Message-ID: <20210405130806.243629-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/enchant/enchant.hash | 4 ++--
 package/enchant/enchant.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enchant/enchant.hash b/package/enchant/enchant.hash
index 84d738ffa..9cee2d78e 100644
--- a/package/enchant/enchant.hash
+++ b/package/enchant/enchant.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  a29c5777c4e45fcac2595c15c49d6d2aa434fa5e7c993dff3f9f367b65fe472a  enchant-2.2.11.tar.gz
-sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING.LIB
+sha256  3b0f2215578115f28e2a6aa549b35128600394304bd79d6f28b0d3b3d6f46c03  enchant-2.2.15.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index c342600bd..3135550f7 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENCHANT_VERSION = 2.2.11
+ENCHANT_VERSION = 2.2.15
 ENCHANT_SITE = \
 	https://github.com/AbiWord/enchant/releases/download/v$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
-- 
2.27.0
