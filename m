From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:25 +0200
Subject: [Buildroot] [PATCH 02/12 v8] package/eudev: use the description on
	their home page
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <768a45f047f45539096a7b054dad204b3c9336a4.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/eudev/Config.in | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index cda06e7..6412675 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -9,11 +9,10 @@ config BR2_PACKAGE_EUDEV
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_KMOD
 	help
-	  Userspace device daemon. This is a standalone version,
-	  independent of systemd. It is a fork maintained by Gentoo.
-
-	  eudev requires a Linux kernel >= 2.6.34: it relies on devtmpfs
-	  and inotify.
+	  eudev is a fork of systemd-udev with the goal of obtaining better
+	  compatibility with existing software such as OpenRC and Upstart,
+	  older kernels, various toolchains and anything else required by
+	  users and various distributions.
 
 	  https://wiki.gentoo.org/wiki/Project:Eudev
 
-- 
2.7.4
