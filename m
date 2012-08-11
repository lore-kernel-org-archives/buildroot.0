From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:10:18 -0400
Subject: [Buildroot] [PATCH 08/17] libdnet: add license info
In-Reply-To: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
References: <1344715827-9452-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1344715827-9452-8-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/libdnet/libdnet.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index e622dd4..f6daffd 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -7,6 +7,8 @@
 LIBDNET_VERSION = 1.11
 LIBDNET_SOURCE = libdnet-$(LIBDNET_VERSION).tar.gz
 LIBDNET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdnet/
+LIBDNET_LICENSE = BSD-3c
+LIBDNET_LICENSE_FILES = LICENSE
 LIBDNET_INSTALL_STAGING = YES
 LIBDNET_AUTORECONF = YES
 LIBDNET_CONF_OPT = \
-- 
1.7.9.5
