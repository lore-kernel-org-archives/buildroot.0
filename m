From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:42 -0000
Subject: [Buildroot] [git commit branch/next] kmod: bump to 9
Message-ID: <20120802195241.6CC4D8E204@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=15be013f186b7133c1b6a0a4a8dcf976922f4864
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 1382901..be640c7 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -1,4 +1,4 @@
-KMOD_VERSION = 8
+KMOD_VERSION = 9
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
