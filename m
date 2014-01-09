From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 9 Jan 2014 13:18:39 +0100
Subject: [Buildroot] [git commit] network-manager: bump to version 0.9.8.2
Message-ID: <20140109122318.3BEF09C409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4bf77bf89a108b8e542cc162a4c3c268743fd24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/network-manager/network-manager.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index e847f25..cd8b528 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NETWORK_MANAGER_VERSION_MAJOR = 0.9
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8.0
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8.2
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
