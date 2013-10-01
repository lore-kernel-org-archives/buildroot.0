From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:26:19 +0200
Subject: [Buildroot] [git commit] mtdev: bump version to 1.1.4
Message-ID: <20131001193429.7C7E89B313@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e162a76ff3fa7ac3536cb0498e3e9b8d2eebee6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtdev/mtdev.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mtdev/mtdev.mk b/package/mtdev/mtdev.mk
index 5c94352..3ae2a10 100644
--- a/package/mtdev/mtdev.mk
+++ b/package/mtdev/mtdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTDEV_VERSION = 1.1.3
+MTDEV_VERSION = 1.1.4
 MTDEV_SOURCE = mtdev-$(MTDEV_VERSION).tar.bz2
 MTDEV_SITE = http://bitmath.org/code/mtdev/
 
