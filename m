From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 01:08:31 +0100
Subject: [Buildroot] [git commit] civetweb: bump version
Message-ID: <20141027002037.01F57B0FF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4573ba9cec3458790bf30ecf34b24eb256f32e1c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/civetweb/civetweb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 9d5eecd..2940a7a 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = v1.3
+CIVETWEB_VERSION = v1.5
 CIVETWEB_SITE = $(call github,sunsetbrew,civetweb,$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
