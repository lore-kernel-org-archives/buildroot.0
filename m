From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jun 2014 08:57:12 +0200
Subject: [Buildroot] [git commit] metacity: add license information
Message-ID: <20140627070642.8B5849D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9fbd8cc07e26cd4cc436e015a14aeee5563f2619
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/metacity/metacity.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/metacity/metacity.mk b/package/metacity/metacity.mk
index 0df09c4..6ded5d1 100644
--- a/package/metacity/metacity.mk
+++ b/package/metacity/metacity.mk
@@ -9,6 +9,8 @@ METACITY_VERSION_MAJOR = 2.25
 METACITY_VERSION = $(METACITY_VERSION_MAJOR).1
 METACITY_SOURCE = metacity-$(METACITY_VERSION).tar.bz2
 METACITY_SITE = http://ftp.gnome.org/pub/gnome/sources/metacity/$(METACITY_VERSION_MAJOR)
+METACITY_LICENSE = GPLv2+
+METACITY_LICENSE_FILES = COPYING
 
 METACITY_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		--x-libraries=$(STAGING_DIR)/usr/lib \
