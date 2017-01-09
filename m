From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  9 Jan 2017 11:15:20 -0500
Subject: [Buildroot] [2/5] libselinux: bump version to 2.6
In-Reply-To: <20170109161523.6855-1-aduskett@codeblue.com>
References: <20170109161523.6855-1-aduskett@codeblue.com>
Message-ID: <20170109161523.6855-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/libselinux/libselinux.hash | 2 +-
 package/libselinux/libselinux.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index a4c3440..76130b2 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 94c9e97706280bedcc288f784f67f2b9d3d6136c192b2c9f812115edba58514f libselinux-2.5.tar.gz
+sha256 4ea2dde50665c202253ba5caac7738370ea0337c47b251ba981c60d24e1a118a libselinux-2.6.tar.gz
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 165ac4c..44120c4 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 2.5
-LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20160223
+LIBSELINUX_VERSION = 2.6
+LIBSELINUX_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20161014
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
 
-- 
2.9.3
