From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 16:35:10 +0200
Subject: [Buildroot] [git commit] shared-mime-info: add license information
Message-ID: <20140626143652.BF15C9D0C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e22599f6f5c306683622d7cca6b87f088aa155ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/shared-mime-info/shared-mime-info.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/shared-mime-info/shared-mime-info.mk b/package/shared-mime-info/shared-mime-info.mk
index d147bb7..2f9126b 100644
--- a/package/shared-mime-info/shared-mime-info.mk
+++ b/package/shared-mime-info/shared-mime-info.mk
@@ -7,14 +7,13 @@
 SHARED_MIME_INFO_VERSION = 0.90
 SHARED_MIME_INFO_SOURCE = shared-mime-info-$(SHARED_MIME_INFO_VERSION).tar.bz2
 SHARED_MIME_INFO_SITE = http://freedesktop.org/~hadess
-
 SHARED_MIME_INFO_INSTALL_STAGING = YES
-
 SHARED_MIME_INFO_CONF_ENV = XMLLINT=$(HOST_DIR)/usr/bin/xmllint
 SHARED_MIME_INFO_DEPENDENCIES = host-pkgconf host-libglib2 host-libxml2 host-shared-mime-info libxml2 libglib2
-
 SHARED_MIME_INFO_CONF_OPT = --disable-update-mimedb
 SHARED_MIME_INFO_MAKE = $(MAKE1)
+SHARED_MIME_INFO_LICENSE = GPLv2
+SHARED_MIME_INFO_LICENSE_FILES = COPYING
 
 HOST_SHARED_MIME_INFO_DEPENDENCIES = host-pkgconf host-intltool
 
