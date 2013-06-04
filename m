From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon,  3 Jun 2013 22:03:32 -0400
Subject: [Buildroot] [PATCH 4/7] libmpeg2: add license info
In-Reply-To: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
References: <1370311415-1966-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1370311415-1966-4-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, remove trailing slash from site.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libmpeg2/libmpeg2.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
index dbb7114..f3cf245 100644
--- a/package/libmpeg2/libmpeg2.mk
+++ b/package/libmpeg2/libmpeg2.mk
@@ -5,7 +5,9 @@
 #############################################################
 LIBMPEG2_VERSION = 0.5.1
 LIBMPEG2_SOURCE = libmpeg2-$(LIBMPEG2_VERSION).tar.gz
-LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files/
+LIBMPEG2_SITE = http://libmpeg2.sourceforge.net/files
+LIBMPEG2_LICENSE = GPLv2+
+LIBMPEG2_LICENSE_FILES = COPYING
 LIBMPEG2_INSTALL_STAGING = YES
 LIBMPEG2_AUTORECONF = YES
 LIBMPEG2_CONF_OPT = --without-x --disable-directx
-- 
1.7.9.5
