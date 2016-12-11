From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 15:41:51 +0100
Subject: [Buildroot] [git commit] Config.in.legacy: findfs is available in
	BR2_PACKAGE_UTIL_LINUX_BINARIES
Message-ID: <20161211144316.B3B908192A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=860020f300fd6bc567a76c48abd412729cccb90e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

031659024b3cf27bb68dc58d07519b563ef472a1 removed the option
BR2_PACKAGE_UTIL_LINUX_FINDFS as it is always built by default.

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 39a2d00..b42eb41 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -667,7 +667,7 @@ config BR2_PACKAGE_E2FSPROGS_FINDFS
 	  This option attempted to enable findfs capabilities from
 	  e2fsprogs but has not worked since July 2015 (due to
 	  packaging changes). One can use BusyBox's findfs support or
-	  enable the BR2_PACKAGE_UTIL_LINUX_FINDFS option.
+	  enable the BR2_PACKAGE_UTIL_LINUX_BINARIES option.
 
 config BR2_PACKAGE_OPENPOWERLINK_DEBUG_LEVEL
 	bool "openpowerlink debug option has been removed"
