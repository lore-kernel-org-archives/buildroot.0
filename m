From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 00:41:22 -0800
Subject: [Buildroot] [git commit] links: bump to version 2.7
Message-ID: <20121205091358.E7D628FDC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e19201c98f554c267bcf3ad623dd6397615c8875
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/links/links.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/links/links.mk b/package/links/links.mk
index 5db2ff7..f7401bb 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-LINKS_VERSION = 2.5
+LINKS_VERSION = 2.7
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
+LINKS_LICNSE = GPLv2+
+LINKS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPT += --enable-graphics
