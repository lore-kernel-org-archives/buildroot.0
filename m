From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] flex: bump to 2.5.35
Message-ID: <20100128150632.222AA77719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a2d69c204fd060827629660a952caf5840250baa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3
