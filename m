From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:02:37 +0100
Subject: [Buildroot] [git commit] libiscsi: comma separate licenses
Message-ID: <20151215210844.175B080409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7e4e86d1af45dd604164a7b6609ebbe24da2fb9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiscsi/libiscsi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index adb94bd..71c10c1 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -6,7 +6,7 @@
 
 LIBISCSI_VERSION = 1.15.0
 LIBISCSI_SITE = https://sites.google.com/site/libiscsitarballs/libiscsitarballs
-LIBISCSI_LICENSE = GPLv2+ LGPLv2.1+
+LIBISCSI_LICENSE = GPLv2+, LGPLv2.1+
 LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 
