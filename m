From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 11:48:48 +0200
Subject: [Buildroot] [git commit] evemu: bump version to 2.3.1
Message-ID: <20151016111136.6089B7FBFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0235aa4a58a942f8a053f9b58ed2148643ba1315
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See [1] for details.

[1] http://lists.freedesktop.org/archives/input-tools/2015-October/001221.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/evemu/evemu.hash |    4 ++--
 package/evemu/evemu.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
index 9d7bb50..f7a0cc6 100644
--- a/package/evemu/evemu.hash
+++ b/package/evemu/evemu.hash
@@ -1,2 +1,2 @@
-# Hash from http://lists.freedesktop.org/archives/input-tools/2015-August/001190.html
-sha256 e0f79808959d1b1f307a3d5add8ee9e5786d926e9aeb0045dadb85c7350d0a3c evemu-2.2.0.tar.xz
+# Hash from http://lists.freedesktop.org/archives/input-tools/2015-October/001221.html
+sha256 5b0197735f9effa25563b0412c560354bee34f8263eaddb00dd996e6ff56eb6a evemu-2.3.1.tar.xz
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index ad56888..2fce723 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 2.2.0
+EVEMU_VERSION = 2.3.1
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPLv3 (library), GPLv3 (tools)
