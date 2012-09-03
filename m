From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:05:42 -0000
Subject: [Buildroot] [git commit] smartmontools: bump to version 5.43
Message-ID: <20120903200540.1C8DA9953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47a3fa7b593adb77c2f9f1a4b1608ac2ce2af6d8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/smartmontools/smartmontools.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index a6873f0..3c573f8 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,9 @@
 #
 #############################################################
 
-SMARTMONTOOLS_VERSION = 5.42
+SMARTMONTOOLS_VERSION = 5.43
 SMARTMONTOOLS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/smartmontools
+SMARTMONTOOLS_LICENSE = GPLv2+
+SMARTMONTOOLS_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
