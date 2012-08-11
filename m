From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sat, 11 Aug 2012 16:13:35 -0400
Subject: [Buildroot] [PATCH 17/17] spawn-fcgi: add license info
Message-ID: <1344716015-10001-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/spawn-fcgi/spawn-fcgi.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/spawn-fcgi/spawn-fcgi.mk b/package/spawn-fcgi/spawn-fcgi.mk
index 9014d21..7c23421 100644
--- a/package/spawn-fcgi/spawn-fcgi.mk
+++ b/package/spawn-fcgi/spawn-fcgi.mk
@@ -7,6 +7,8 @@
 SPAWN_FCGI_VERSION = 1.6.3
 SPAWN_FCGI_SITE = http://www.lighttpd.net/download
 SPAWN_FCGI_SOURCE = spawn-fcgi-$(SPAWN_FCGI_VERSION).tar.bz2
+SPAWN_FCGI_LICENSE = BSD-3c
+SPAWN_FCGI_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_INET_IPV6),y)
 SPAWN_FCGI_CONF_OPT = --disable-ipv6
-- 
1.7.9.5
