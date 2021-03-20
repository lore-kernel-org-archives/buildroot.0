From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:20:11 +0100
Subject: [Buildroot] [git commit] package/haproxy: bump to version 2.2.10
Message-ID: <20210320205605.59FA48807C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31f6fc2bdeaf36b9aa342b74f68495f76d73c976
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.mail-archive.com/haproxy at formilux.org/msg39916.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 956949275e..04cb2e3c06 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.9.tar.gz.sha256
-sha256  21680459b08b9ba21c8cc9f5dbd0ee6e1842f57a3a67f87179871e1c13ebd4e3  haproxy-2.2.9.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.10.tar.gz.sha256
+sha256  a027e9cd8f703ba48dc193f5ae34d9aa152221f67ab58a4e939c96b9f4edd3bc  haproxy-2.2.10.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 45c62f7c21..03c872e6b2 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).9
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).10
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
