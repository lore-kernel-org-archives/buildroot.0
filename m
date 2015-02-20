From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:34:21 +0100
Subject: [Buildroot] [git commit branch/next] exfat-utils: bump to version
	1.1.1
Message-ID: <20150220183426.034DB817C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=68a329fabd382796065bd25b619fbb239e34cf98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exfat-utils/exfat-utils.hash |    2 ++
 package/exfat-utils/exfat-utils.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
new file mode 100644
index 0000000..79ccf42
--- /dev/null
+++ b/package/exfat-utils/exfat-utils.hash
@@ -0,0 +1,2 @@
+# From https://code.google.com/p/exfat/wiki/Downloads?tm=2
+sha1	ddf0819c27aeb3eaae5aae0423d4dafc54d477da	exfat-utils-1.1.1.tar.gz
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index a7e90dd..4f43233 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.1.0
+EXFAT_UTILS_VERSION = 1.1.1
 EXFAT_UTILS_SITE = http://distfiles.gentoo.org/distfiles
 EXFAT_UTILS_DEPENDENCIES = host-scons
 EXFAT_UTILS_LICENSE = GPLv3+
