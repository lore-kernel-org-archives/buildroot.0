From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Jul 2014 21:50:13 +0200
Subject: [Buildroot] [git commit] network-manager: bump to 0.9.10.0
Message-ID: <20140706195228.C438C9D17F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3ce2eb0e2ae70a21eacbba2421e0cbe49c8eb96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/network-manager.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 932ce8f..bee06cc 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 0.9
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).9.98
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).10.0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
