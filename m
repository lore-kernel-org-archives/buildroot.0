From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:51:58 +0100
Subject: [Buildroot] [git commit] package/libubootenv: bump to version
 9294981
Message-ID: <20191202083935.A5BCC82884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e472fe8f9dffed0cd57c3bd1cc5d339ad6e0ca4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes the following changes:

9294981 handle protected mmcblk_boot_ devices
ac6d18a add missing includes
8106b65 add .editorconfig file

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libubootenv/libubootenv.hash | 2 +-
 package/libubootenv/libubootenv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubootenv/libubootenv.hash b/package/libubootenv/libubootenv.hash
index 81f72ad57c..36396ac732 100644
--- a/package/libubootenv/libubootenv.hash
+++ b/package/libubootenv/libubootenv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9c8b0e6d596b43127ccdf6b2d181dce597fb1f90211aa36c4d88b5c6a31ef026 libubootenv-3286c571c7e15be4b341e46986f1c0dc74730207.tar.gz
+sha256 38431bcbb93fa1a6065828947ca9f9510709b5ac57f8f700fd91473236885064 libubootenv-92949816720d7af2ac722016e7a5b9a85ff141bc.tar.gz
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 Licenses/lgpl-2.1.txt
diff --git a/package/libubootenv/libubootenv.mk b/package/libubootenv/libubootenv.mk
index b24008ca33..2c6abe8794 100644
--- a/package/libubootenv/libubootenv.mk
+++ b/package/libubootenv/libubootenv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOOTENV_VERSION = 3286c571c7e15be4b341e46986f1c0dc74730207
+LIBUBOOTENV_VERSION = 92949816720d7af2ac722016e7a5b9a85ff141bc
 LIBUBOOTENV_SITE = $(call github,sbabic,libubootenv,$(LIBUBOOTENV_VERSION))
 LIBUBOOTENV_LICENSE = LGPL-2.1
 LIBUBOOTENV_LICENSE_FILES = Licenses/lgpl-2.1.txt
