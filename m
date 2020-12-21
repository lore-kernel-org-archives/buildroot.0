From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 14:51:33 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/haproxy: bump to
 version 2.2.6
Message-ID: <20201221134035.A13A988305@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10def0dc85a0551256549f69c7e70f487bc9817e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Two major bugs were fixed in this versions, both leading to a memory
corruption and random crashes.

https://www.mail-archive.com/haproxy at formilux.org/msg39068.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ed5082f012daedad6049491383215fc46af9979b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 5140c6a944..fbbd2e4bab 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.5.tar.gz.sha256
-sha256  63ad1813e01992d0fbe5ac7ca3e516a53fc62cdb17845d5ac90260031b6dd747  haproxy-2.2.5.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.6.tar.gz.sha256
+sha256  be1c6754cbaceafc4837e0c6036c7f81027a3992516435cbbbc5dc749bf5a087  haproxy-2.2.6.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 1912a219e1..a6e07c9adb 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).5
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).6
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
