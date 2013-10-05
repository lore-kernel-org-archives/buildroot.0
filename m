From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Oct 2013 21:11:51 +0200
Subject: [Buildroot] [git commit] neon: bump to version 0.30.0
Message-ID: <20131005191321.995389B92E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1952897ba6db279e9ac705d0a5570a517e1a04b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neon/neon.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 2edc6b2..177ae6a 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.29.6
+NEON_VERSION = 0.30.0
 NEON_SITE = http://www.webdav.org/neon/
 NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
