From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 15:30:20 +0200
Subject: [Buildroot] [git commit] package/exfat-utils: indicate difference
 with exfatprogs in Config.in help
Message-ID: <20200419131603.D70088F19B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91e53481ad8169740fa458b20a503758f5f3361d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exfat-utils/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/exfat-utils/Config.in b/package/exfat-utils/Config.in
index 9dfbbfcfb8..4e8f167db4 100644
--- a/package/exfat-utils/Config.in
+++ b/package/exfat-utils/Config.in
@@ -4,6 +4,13 @@ config BR2_PACKAGE_EXFAT_UTILS
 	help
 	  exFAT filesystem utilities.
 
+	  This is the set of user-space utilities that go together
+	  with the FUSE-based exfat driver from package/exfat.
+
+	  If you're using the exfat driver from the official Linux
+	  kernel (merged as of Linux 5.7), you must use the user-space
+	  utilities from package/exfatprogs.
+
 	  https://github.com/relan/exfat
 
 comment "exfat-utils needs a toolchain w/ wchar"
