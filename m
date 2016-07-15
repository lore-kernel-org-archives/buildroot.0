From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 19:39:58 +0200
Subject: [Buildroot] [git commit] package/eudev: use the description on
	their home page
Message-ID: <20160715183413.7E0887FC6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53e49ce9cad5580de710be4a45884d4e2a44c6fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
