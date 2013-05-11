From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 09:52:55 +0200
Subject: [Buildroot] [git commit] atk: add license information
Message-ID: <20130511075917.37BDA9A091@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9988d3f7800097cd62439b380ccf039790712f58
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/atk/atk.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 2a85edd..f5b2e91 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -3,10 +3,13 @@
 # atk
 #
 #############################################################
+
 ATK_VERSION_MAJOR = 1.33
 ATK_VERSION = $(ATK_VERSION_MAJOR).6
 ATK_SOURCE = atk-$(ATK_VERSION).tar.bz2
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
+ATK_LICENSE = LGPLv2+
+ATK_LICENSE_FILES = COPYING
 ATK_INSTALL_STAGING = YES
 ATK_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
