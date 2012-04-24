From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 24 Apr 2012 22:06:11 +0200
Subject: [Buildroot] [git commit] lame: bump to version 3.99.5
Message-ID: <20120424203537.6729D96BAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3729de402c72e6332139f96e9c4e37a6a612d08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/lame/lame.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index fbf0dda..7b4b0ae 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-LAME_VERSION = 3.99
-LAME_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/lame
+LAME_VERSION_MAJOR = 3.99
+LAME_VERSION_MINOR = 5
+LAME_VERSION = $(LAME_VERSION_MAJOR).$(LAME_VERSION_MINOR)
+LAME_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lame/lame/$(LAME_VERSION_MAJOR)
 LAME_DEPENDENCIES = host-pkg-config
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
