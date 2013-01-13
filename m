From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 19:56:46 +0100
Subject: [Buildroot] [git commit] ofono: bump version
Message-ID: <20130113192104.0156C99900@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98c69143c48eb7eb720f8ad47fc3aa6715f6fa45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ofono/ofono.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 6e6849b..e552eac 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -3,7 +3,7 @@
 # ofono
 #
 #############################################################
-OFONO_VERSION = 1.6
+OFONO_VERSION = 1.7
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_DEPENDENCIES = \
 	host-pkgconf \
