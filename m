From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jan 2014 23:19:34 +0100
Subject: [Buildroot] [git commit] xavante: bump to version 2.3.0
Message-ID: <20140113222142.438799C4A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75370dc088d5ccff5638a158183e8379456cb768
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xavante/xavante.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index c8d4d93..07f9ee6 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAVANTE_VERSION = 2.2.0-1
+XAVANTE_VERSION = 2.3.0-1
 XAVANTE_LICENSE = MIT
 
 $(eval $(luarocks-package))
