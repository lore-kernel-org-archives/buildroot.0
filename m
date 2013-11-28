From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2013 15:13:00 +0100
Subject: [Buildroot] [git commit branch/next] ofono: bump version to 1.13
Message-ID: <20131128141416.15B7C9BD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=daa3232d647deb8f05bdb2761e2844a38e816fe6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ofono/ofono.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ofono/ofono.mk b/package/ofono/ofono.mk
index 4b3b7a5..aaaa8fa 100644
--- a/package/ofono/ofono.mk
+++ b/package/ofono/ofono.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OFONO_VERSION = 1.12
+OFONO_VERSION = 1.13
 OFONO_SOURCE = ofono-$(OFONO_VERSION).tar.xz
 OFONO_SITE = $(BR2_KERNEL_MIRROR)/linux/network/ofono
 OFONO_LICENSE = GPLv2
