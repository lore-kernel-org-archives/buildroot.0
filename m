From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 14:17:36 +0100
Subject: [Buildroot] [git commit] package/libndp: bump version to 1.5
Message-ID: <20160201224704.9E8747F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b081bb742c65e52e0d3624c5d8ec014543a7369
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libndp/libndp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index c40a017..c880b7e 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = v1.4
+LIBNDP_VERSION = v1.5
 LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPLv2.1+
 LIBNDP_LICENSE_FILES = COPYING
