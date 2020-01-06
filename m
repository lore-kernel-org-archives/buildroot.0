From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 23:29:54 +0100
Subject: [Buildroot] [git commit] package/libubootenv: bump to version
 cc628ee
Message-ID: <20200106222010.B45B482A39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b58773299bbdef876d93a4aaaa163eccbdb3715
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes the following changes:

cc628ee libuboot: wrap libuboot in extern "C" for C++
bf6ff63 Prepare 0.2
3393485 Fix compiler warning
8f7c00a uboot_env: fix the resarch of ubi volume

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libubootenv/libubootenv.hash | 2 +-
 package/libubootenv/libubootenv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 36396ac732..161a8dd5f7 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 38431bcbb93fa1a6065828947ca9f9510709b5ac57f8f700fd91473236885064 libubootenv-92949816720d7af2ac722016e7a5b9a85ff141bc.tar.gz
+sha256 4d948a8b7e4fb92c36c36a1a247c1bab4343c55b5324699d18ea012737dbedeb libubootenv-cc628ee0cd750be26275b6eaeaba4d324df11dec.tar.gz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 Licenses/lgpl-2.1.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index 2c6abe8794..ae3db40178 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 92949816720d7af2ac722016e7a5b9a85ff141bc
+LIBUBOOTENV_VERSION = cc628ee0cd750be26275b6eaeaba4d324df11dec
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1
 LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
