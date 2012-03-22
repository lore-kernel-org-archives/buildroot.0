From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Mar 2012 11:57:15 +0100
Subject: [Buildroot] [git commit] kmod: bump version
Message-ID: <20120322110548.1EAFB9693C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8fce69fd2f42290d0794b4cc823312d4205ff9dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 028d351..f71087c 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -1,4 +1,4 @@
-KMOD_VERSION = 6
+KMOD_VERSION = 7
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod/
 KMOD_INSTALL_STAGING = YES
