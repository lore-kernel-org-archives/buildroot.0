From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Sep 2017 22:13:36 +0200
Subject: [Buildroot] [git commit] evemu: bump version to 2.7.0
Message-ID: <20170928200649.3134E807B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e935f3e80597e78f5189bd702c371190a8e11c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See [1] for details.

[1] https://lists.freedesktop.org/archives/input-tools/2017-September/001416.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/evemu/evemu.hash | 4 ++--
 package/evemu/evemu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
index b5f0bf5..7d45eb3 100644
--- a/package/evemu/evemu.hash
+++ b/package/evemu/evemu.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256 ed81dd4552ffeb92c346b47e56b249c67f1cb37d5b31fc073ea0ad4858ae3dcc  evemu-2.6.0.tar.xz
+# From https://lists.freedesktop.org/archives/input-tools/2017-September/001416.html
+sha256 78c9400d55eeeb5ab75161360543f9376438c4da4934cb34cdda5b46021ae379 evemu-2.7.0.tar.xz
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index fba4521..02e5abd 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 2.6.0
+EVEMU_VERSION = 2.7.0
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPL-3.0 (library), GPL-3.0 (tools)
