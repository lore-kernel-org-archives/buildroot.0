From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 14:56:06 +0200
Subject: [Buildroot] [git commit] package/evemu: bump version to 2.6.0
Message-ID: <20170601202858.17F2782641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34f6719a4fe8285b7e9ecde6c88686fbc508ad8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream did not sent an announcement so the hash had to be computed
locally.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/evemu/evemu.hash | 4 ++--
 package/evemu/evemu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/evemu/evemu.hash b/package/evemu/evemu.hash
index 5e653f7..b5f0bf5 100644
--- a/package/evemu/evemu.hash
+++ b/package/evemu/evemu.hash
@@ -1,2 +1,2 @@
-# Hash from https://lists.freedesktop.org/archives/input-tools/2016-September/001330.html
-sha256 541cc138f0215b7d0cd4ad5e6bb1402518ffc5e31294c36bb67b4ff1791bb27f evemu-2.5.0.tar.xz
+# Locally computed
+sha256 ed81dd4552ffeb92c346b47e56b249c67f1cb37d5b31fc073ea0ad4858ae3dcc  evemu-2.6.0.tar.xz
diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index d525207..fba4521 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVEMU_VERSION = 2.5.0
+EVEMU_VERSION = 2.6.0
 EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPL-3.0 (library), GPL-3.0 (tools)
