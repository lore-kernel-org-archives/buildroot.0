From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  9 Aug 2012 10:59:32 +0100
Subject: [Buildroot] [PATCH] libtpl: add license information
Message-ID: <1344506373-17490-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libtpl/libtpl.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index 45089b5..7af0b06 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -7,5 +7,7 @@ LIBTPL_VERSION = 1.5
 LIBTPL_SOURCE = libtpl-$(LIBTPL_VERSION).tar.bz2
 LIBTPL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tpl
 LIBTPL_INSTALL_STAGING = YES
+LIBTPL_LICENSE = BSD-like
+LIBTPL_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
-- 
1.7.9.5
