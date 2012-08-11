From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:12:41 -0400
Subject: [Buildroot] [PATCH 12/17] lighttpd: add license info
Message-ID: <1344715961-9759-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/lighttpd/lighttpd.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index c9decb1..4bad5ba 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -6,6 +6,8 @@
 
 LIGHTTPD_VERSION = 1.4.31
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-1.4.x
+LIGHTTPD_LICENSE = BSD-3c
+LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_DEPENDENCIES = host-pkg-config
 LIGHTTPD_CONF_OPT = \
 	--libdir=/usr/lib/lighttpd \
-- 
1.7.9.5
