From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 15 Nov 2009 11:12:51 +0100
Subject: [Buildroot] [PATCH 2/8] flex: bump to 2.5.35
In-Reply-To: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
References: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1258279977-1482-3-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/flex/flex.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index b4e0cb9..d8a85bd 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -3,8 +3,8 @@
 # flex
 #
 #############################################################
-FLEX_VERSION:=2.5.33
-FLEX_PATCH_VERSION:=11
+FLEX_VERSION:=2.5.35
+FLEX_PATCH_VERSION:=9
 FLEX_SOURCE:=flex_$(FLEX_VERSION).orig.tar.gz
 FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/f/flex
-- 
1.6.5.2
