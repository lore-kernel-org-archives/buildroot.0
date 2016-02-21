From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:39:20 +0100
Subject: [Buildroot] [git commit] package/e2fsprogs: remove whitespace
Message-ID: <20160221133956.0D60580415@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0fcaabc3eaa5e048312cb666e3a063b2c0a9f09c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/e2fsprogs/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index ac3eae7..e540337 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -1,4 +1,3 @@
-
 config BR2_PACKAGE_E2FSPROGS
 	bool "e2fsprogs"
 	depends on BR2_USE_WCHAR # util-linux
