From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 18:01:08 +0200
Subject: [Buildroot] [git commit] blackbox: add license information
Message-ID: <20140629160112.A71449D10A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5d9215351f3b529bfdf625742eec530e2739b11b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/blackbox/blackbox.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/blackbox/blackbox.mk b/package/blackbox/blackbox.mk
index ce8f06e..b7b9726 100644
--- a/package/blackbox/blackbox.mk
+++ b/package/blackbox/blackbox.mk
@@ -7,11 +7,11 @@
 BLACKBOX_VERSION = 0.70.1
 BLACKBOX_SOURCE = blackbox-$(BLACKBOX_VERSION).tar.bz2
 BLACKBOX_SITE = http://downloads.sourceforge.net/project/blackboxwm/blackboxwm/Blackbox%20$(BLACKBOX_VERSION)
-
 BLACKBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib
-
 BLACKBOX_DEPENDENCIES = xlib_libX11
+BLACKBOX_LICENSE = MIT
+BLACKBOX_LICENSE_FILES = LICENSE
 
 ifneq ($(BR2_ENABLE_LOCALE),y)
 BLACKBOX_DEPENDENCIES += libiconv
