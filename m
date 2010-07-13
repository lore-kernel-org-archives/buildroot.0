From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Tue, 13 Jul 2010 14:11:59 +0200
Subject: [Buildroot] [PATCH] Bump Flex patch version.
Message-ID: <1279023119-2045-1-git-send-email-julien.boibessot@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Julien Boibessot <julien.boibessot@armadeus.com>

Version 9 is no more available on Debian FTP.

Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
---
 package/flex/flex.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index 43e7d57..ad35548 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 FLEX_VERSION:=2.5.35
-FLEX_PATCH_VERSION:=9
+FLEX_PATCH_VERSION:=9.1
 FLEX_SOURCE:=flex_$(FLEX_VERSION).orig.tar.gz
 FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
-- 
1.6.0.4
