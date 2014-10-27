From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 01:19:35 +0100
Subject: [Buildroot] [git commit] jsmin: bump version
Message-ID: <20141027002037.4CEEFB0DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f0e039547a1e3ccc87843c962fbef9bc48cd9ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jsmin/jsmin.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 957b686..a66ba71 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JSMIN_VERSION = a9b47554d5684a55301a2eb7ca8480b7ee7630d4
+JSMIN_VERSION = 1bf6ce5f74a9f8752ac7f5d115b8d7ccb31cfe1b
 JSMIN_SITE = $(call github,douglascrockford,JSMin,$(JSMIN_VERSION))
 JSMIN_LICENSE = MIT
 JSMIN_LICENSE_FILES = jsmin.c
