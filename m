From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Thu, 12 Nov 2015 11:26:29 +0100
Subject: [Buildroot] [PATCH 1/1] libnet:explicitly pass
	libnet_cv_have_packet_socket=yes
Message-ID: <1447323989-6331-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/libnet/libnet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnet/libnet.mk b/package/libnet/libnet.mk
index 3b62a79..ab825a4 100644
--- a/package/libnet/libnet.mk
+++ b/package/libnet/libnet.mk
@@ -7,6 +7,7 @@
 LIBNET_VERSION = 1.1.6
 LIBNET_SITE = http://sourceforge.net/projects/libnet-dev/files
 LIBNET_INSTALL_STAGING = YES
+LIBNET_CONF_OPTS = libnet_cv_have_packet_socket=yes
 LIBNET_LICENSE = BSD-2c, BSD-3c
 LIBNET_LICENSE_FILES = doc/COPYING
 
-- 
1.8.3.1
