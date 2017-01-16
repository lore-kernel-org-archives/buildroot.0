From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 15:30:23 +0100
Subject: [Buildroot] [git commit] zlib: bump to version 1.2.11
Message-ID: <20170116143128.7D90381E43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb0c2daae6da68415eb9a542a3205d39305bdc0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlib/zlib.hash | 2 +-
 package/zlib/zlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib/zlib.hash b/package/zlib/zlib.hash
index 17dc9b4..81cb64e 100644
--- a/package/zlib/zlib.hash
+++ b/package/zlib/zlib.hash
@@ -1,2 +1,2 @@
 # From http://www.zlib.net/
-sha256 9612bf086047078ce3a1c154fc9052113fc1a2a97234a059da17a6299bd4dd32  zlib-1.2.10.tar.xz
+sha256 4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index ba07f2c..deea5a5 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZLIB_VERSION = 1.2.10
+ZLIB_VERSION = 1.2.11
 ZLIB_SOURCE = zlib-$(ZLIB_VERSION).tar.xz
 ZLIB_SITE = http://www.zlib.net
 ZLIB_LICENSE = zlib license
