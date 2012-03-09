From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  9 Mar 2012 15:39:48 +0100
Subject: [Buildroot] [PATCH 3/5] network-manager: remove double libnl
	dependency
In-Reply-To: <1331303990-13548-1-git-send-email-yegorslists@googlemail.com>
References: <1331303990-13548-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1331303990-13548-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/network-manager/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 9708a11..fb0c0e9 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
-	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_UTIL_LINUX
-- 
1.7.7
