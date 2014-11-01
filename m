From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 21:34:34 +0100
Subject: [Buildroot] [git commit] linenoise: bump version and license
Message-ID: <20141101204148.3DE76B2A4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c37e0c8008ebb96a954a0a6f6bc568845d83ee53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The project now comes with a LICENSE_FILES.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linenoise/linenoise.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index aff0c7d..7321564 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 828b9dacc52d4ad5a15c89be8fb8691d224f9a4f
+LINENOISE_VERSION = cf1bdf5f89e10b504a0bec3efc8a8587eadecd2c
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2c
+LINENOISE_LICENSE_FILES = LICENSE
 LINENOISE_INSTALL_STAGING = YES
 # Static library only, nothing to install on target
 LINENOISE_INSTALL_TARGET = NO
