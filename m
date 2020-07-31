From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 31 Jul 2020 23:53:43 +0200
Subject: [Buildroot] [PATCH 3/5] package/systemd: remove util-linux binaries
 dependency
In-Reply-To: <20200731215345.19212-1-nolange79@gmail.com>
References: <20200731215345.19212-1-nolange79@gmail.com>
Message-ID: <20200731215345.19212-4-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

None of the tools in this set are necessary.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 56d7eed063..bea8aaa019 100644
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
-- 
2.27.0
