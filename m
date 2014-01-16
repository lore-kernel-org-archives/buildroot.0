From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 08:42:59 +0100
Subject: [Buildroot] [git commit] libmodplug: bump to version 0.8.8.4
Message-ID: <20140116081723.67CC69C506@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98e18c3bf4a1d3d4d8543c59a77987e150620f8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmodplug/libmodplug.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
index 2a74928..1d01252 100644
--- a/package/libmodplug/libmodplug.mk
+++ b/package/libmodplug/libmodplug.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODPLUG_VERSION = 0.8.7
+LIBMODPLUG_VERSION = 0.8.8.4
 LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
 LIBMODPLUG_INSTALL_STAGING = YES
 LIBMODPLUG_LICENSE = Public Domain
