From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 14:29:44 -0800
Subject: [Buildroot] [git commit] owl-linux: add license info
Message-ID: <20121130223215.0088699340@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51eb3be3da6e9ee8b32d6872db5159e594dc98e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/owl-linux/owl-linux.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/owl-linux/owl-linux.mk b/package/owl-linux/owl-linux.mk
index 0a111c8..832f6b1 100644
--- a/package/owl-linux/owl-linux.mk
+++ b/package/owl-linux/owl-linux.mk
@@ -5,6 +5,9 @@
 #############################################################
 OWL_LINUX_VERSION = 1.0.7
 OWL_LINUX_SITE = http://linux.hd-wireless.se/pub/Linux/DownloadDrivers
+OWL_LINUX_LICENSE = PROPRIETARY
+OWL_LINUX_LICENSE_FILES = LICENSE
+OWL_LINUX_REDISTRIBUTE = NO
 
 OWL_LINUX_DEPENDENCIES = linux
 
