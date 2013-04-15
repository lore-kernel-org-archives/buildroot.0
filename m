From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 15 Apr 2013 08:51:40 +0100
Subject: [Buildroot] [PATCH] libid3tag: add license information
Message-ID: <1366012300-32665-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libid3tag/libid3tag.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index fc22976..fff8d8b 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -7,6 +7,8 @@
 LIBID3TAG_VERSION = 0.15.1b
 LIBID3TAG_SOURCE = libid3tag-$(LIBID3TAG_VERSION).tar.gz
 LIBID3TAG_SITE = http://downloads.sourceforge.net/project/mad/libid3tag/$(LIBID3TAG_VERSION)
+LIBID3TAG_LICENSE = GPLv2+
+LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
 LIBID3TAG_DEPENDENCIES = zlib
 LIBID3TAG_LIBTOOL_PATCH = NO
-- 
1.7.10.4
