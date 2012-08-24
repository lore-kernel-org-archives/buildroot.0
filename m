From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Aug 2012 23:48:46 +0200
Subject: [Buildroot] [git commit] wget: bump to version 1.14
Message-ID: <20120903200544.2152599543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=61d1f013d9217633a0f992a5a12d3c6092fefdee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wget/wget.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index a15111c..01ebcb6 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -4,8 +4,10 @@
 #
 #############################################################
 
-WGET_VERSION = 1.13.4
+WGET_VERSION = 1.14
 WGET_SITE = $(BR2_GNU_MIRROR)/wget
+WGET_LICENSE = GPLv3+
+WGET_LICENSE_FILES = COPYING
 
 # Prefer full-blown wget over busybox
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
