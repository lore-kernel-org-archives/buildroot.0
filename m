From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  7 Jan 2014 11:29:21 +0100
Subject: [Buildroot] [PATCH 3/3] network-manager: bump to version 0.9.8.2
In-Reply-To: <1389090561-32196-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389090561-32196-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <1389090561-32196-4-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/network-manager/network-manager.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.9.5
