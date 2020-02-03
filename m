From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 22:42:58 +0100
Subject: [Buildroot] [git commit] package/haproxy: bump to version 2.1.2
Message-ID: <20200203213159.A081F88FE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41ceedabf836cec3c2cff5ec292cf72ac4b85d45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 87a29eeba1..7f03e88d43 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.0/src/haproxy-2.0.10.tar.gz.sha256
-sha256 1d38ab3dd45e930b209e922a360ee8c636103e21e5b5a2656d3795401316a4ea haproxy-2.0.10.tar.gz
+# From: http://www.haproxy.org/download/2.1/src/haproxy-2.1.2.tar.gz.sha256
+sha256	6079b08a8905ade5a9a2835ead8963ee10a855d8508a85efb7181eea2d310b77	haproxy-2.1.2.tar.gz
 # Locally computed:
 sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
 sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 9f6f2818ae..673e092d48 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-HAPROXY_VERSION_MAJOR = 2.0
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).10
+HAPROXY_VERSION_MAJOR = 2.1
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).2
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
