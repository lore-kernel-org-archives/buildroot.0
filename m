From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 21:29:33 +0100
Subject: [Buildroot] [git commit] package/kodi-pvr-iptvsimple: bump version
Message-ID: <20160305203005.388E5817FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e1b48a0abdef6119c8751e3c8c6a097665536eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index f92a8e0..cdf94fd 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 895e8119874ac8d74b69a6441f037465eb70050474d03a345000f147671a310f kodi-pvr-iptvsimple-824c6056b10c89913e1310d0c334206d32f5e1cf.tar.gz
+sha256 5b5c67f70f47c52ccda673c3a98b5a81827835fb74289754bebf840133a84d56 kodi-pvr-iptvsimple-ae9bc1d94e97c5381b2fa59adac70a57146016cd.tar.gz
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 3059425..85039dd 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -6,7 +6,7 @@
 
 # This cset is on the branch 'Jarvis'
 # When Kodi is updated, then this should be updated to the corresponding branch
-KODI_PVR_IPTVSIMPLE_VERSION = 824c6056b10c89913e1310d0c334206d32f5e1cf
+KODI_PVR_IPTVSIMPLE_VERSION = ae9bc1d94e97c5381b2fa59adac70a57146016cd
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPLv2+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = src/client.h
