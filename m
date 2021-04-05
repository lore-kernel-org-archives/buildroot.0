From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:18:16 +0200
Subject: [Buildroot] [git commit] package/haproxy: bump to version 2.2.13
Message-ID: <20210405160039.620C38B774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=398103fbdde093765cec87c89a2ae48ee8b0afe5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://www.haproxy.org/download/2.2/src/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 04cb2e3c06..bea7c4bb2a 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.10.tar.gz.sha256
-sha256  a027e9cd8f703ba48dc193f5ae34d9aa152221f67ab58a4e939c96b9f4edd3bc  haproxy-2.2.10.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.13.tar.gz.sha256
+sha256  9e3e51441c70bedfb494fc9d4b4d3389a71be9a3c915ba3d6f7e8fd9a57ce160  haproxy-2.2.13.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 03c872e6b2..8502ab8a11 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).10
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
