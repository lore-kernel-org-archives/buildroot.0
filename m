From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Sep 2018 15:08:05 +0200
Subject: [Buildroot] [git commit] haproxy: security bump to 1.8.14
Message-ID: <20180928130935.6796A80046@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e4f6b2fc5a6b3d52b86f614ba83de065b72b1b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2018-14645 (see
https://www.mail-archive.com/haproxy at formilux.org/msg31253.html)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 2 +-
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index e6fcb3b65c..f62c340948 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	2bf5dafbb5f1530c0e67ab63666565de948591f8e0ee2a1d3c84c45e738220f1	haproxy-1.8.13.tar.gz
+sha256	b17e402578be85e58af7a3eac99b1f675953bea9f67af2e964cf8bdbd1bd3fdf	haproxy-1.8.14.tar.gz
 sha256	0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28	LICENSE
 sha256	5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a	doc/lgpl.txt
 sha256	ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7	doc/gpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index ea8a3c7c5c..5fc7a945b5 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 1.8
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).14
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
