From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:29:41 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-vbox: bump version
Message-ID: <20160305203005.77A04817C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb7aec9fddfbcbc1d1a52d436fe1ff05ce2c633b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index d19669a..705c0cb 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 0a7974edcbf79de671eefde2ac0e52b10ece337a889eb855fe8fd62277c74c50 kodi-pvr-vbox-a846f6e85d894123986c39226564f9cc11c6f924.tar.gz
+sha256 8eb43fb6e2a3132324bf24787bc0545c610832648aa17c12e93676502f7fc565 kodi-pvr-vbox-15e864d160da5a051e18aef06f3a53e49808be02.tar.gz
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 28ce67a..593c1e7 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_VBOX_VERSION = a846f6e85d894123986c39226564f9cc11c6f924
+KODI_PVR_VBOX_VERSION = 15e864d160da5a051e18aef06f3a53e49808be02
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPLv2+
 KODI_PVR_VBOX_LICENSE_FILES = src/client.h
