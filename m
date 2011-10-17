From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Oct 2011 23:29:31 +0200
Subject: [Buildroot] [git commit] links: bump to version 2.3pre2
Message-ID: <20111018052252.DE5478D1BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6674a4d37c3cc1db03b9a8407c225f3c0f91b7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/links/links.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/links/links.mk b/package/links/links.mk
index 44bf9ec..470b13d 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,9 +4,10 @@
 #
 #############################################################
 
-LINKS_VERSION = 2.3pre1
+LINKS_VERSION = 2.3pre2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_CONF_OPT = --without-x
+LINKS_DEPENDENCIES = host-pkg-config
 
 ifeq ($(BR2_PACKAGE_LINKS_GRAPHICS),y)
 LINKS_CONF_OPT += --enable-graphics
