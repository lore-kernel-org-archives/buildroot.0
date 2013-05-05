From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 5 May 2013 22:41:33 +0200
Subject: [Buildroot] [git commit] webp: bump version
Message-ID: <20130505204341.18F5099B55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f88188f09e10d93a5804ac0719d4a597f6d66c1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webp/webp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 0099c3c..00743dd 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 #####################################################################
 
-WEBP_VERSION = 0.2.1
+WEBP_VERSION = 0.3.0
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = https://webp.googlecode.com/files
 WEBP_LICENSE = BSD-3c
