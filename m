From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 21:45:18 +0100
Subject: [Buildroot] [git commit] package/transmission: bump version to 2.92
Message-ID: <20160313204834.EEFE38025E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e154caf97ec51551cccfa3c4d4f942a3671d10f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 0dc816d..849a722 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	69ff8caf81684155926f437f46bf7df1b1fb304f52c7809f546257e8923f2fd2	transmission-2.90.tar.xz
+sha256	3a8d045c306ad9acb7bf81126939b9594553a388482efa0ec1bfb67b22acd35f	transmission-2.92.tar.xz
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 6aecf60..c8d3773 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.90
+TRANSMISSION_VERSION = 2.92
 TRANSMISSION_SITE = http://download.transmissionbt.com/files
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
