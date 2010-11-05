From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 5 Nov 2010 10:27:37 +0100
Subject: [Buildroot] [git commit master 1/1] directfb: bump to 1.4.10
Message-ID: <20101105092848.18D798DBA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9f049e1c1f529addfeb4f4d7356e1718ffc5b322
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb/directfb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index e4b6d90..2703677 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 DIRECTFB_VERSION_MAJOR:=1.4
-DIRECTFB_VERSION:=1.4.5
+DIRECTFB_VERSION:=$(DIRECTFB_VERSION_MAJOR).10
 DIRECTFB_SITE:=http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE:=DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_AUTORECONF = NO
-- 
1.7.1
