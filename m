From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:47:42 +0200
Subject: [Buildroot] [git commit] package/systemd: remove util-linux
 binaries dependency
Message-ID: <20200805134339.B94E281358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42a96d8a009f93cb4beade8ffbb9b2c1c2b31c97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

None of the tools in this set are necessary.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 48790e1494..223ab6e113 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -29,7 +29,6 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
-	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_AGETTY
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_UTIL_LINUX_NOLOGIN
