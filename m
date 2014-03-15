From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 22:43:19 +0100
Subject: [Buildroot] [git commit] network-manager: bump to 0.9.8.8
Message-ID: <20140315214420.AAD3D9BF8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ad34e5fb4db45c1ff13ae723cd1c182d06d02421
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/network-manager.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 89e0b29..24bae63 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 0.9
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8.2
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8.8
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
