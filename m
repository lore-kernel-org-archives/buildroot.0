From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 17:03:33 +0200
Subject: [Buildroot] [git commit] sysprof: add license information
Message-ID: <20140626151144.5A91C9D018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b11ff692f79f391adb89edf46092c3de3731c89a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysprof/sysprof.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 4f6ed54..0650781 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -7,6 +7,8 @@
 SYSPROF_VERSION = 1.2.0
 SYSPROF_SITE = http://sysprof.com
 SYSPROF_DEPENDENCIES = libglib2
+SYSPROF_LICENSE = GPLv2+
+SYSPROF_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_SYSPROF_GUI),y)
 SYSPROF_DEPENDENCIES += libgtk2 libglade gdk-pixbuf
