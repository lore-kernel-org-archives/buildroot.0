From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Jun 2014 08:48:38 +0200
Subject: [Buildroot] [git commit] gptfdisk: add license information
Message-ID: <20140627070642.61B8A9D0D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b27deab5787326de57e39d2817cefe10b28201c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gptfdisk/gptfdisk.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gptfdisk/gptfdisk.mk b/package/gptfdisk/gptfdisk.mk
index 22bf180..6835f40 100644
--- a/package/gptfdisk/gptfdisk.mk
+++ b/package/gptfdisk/gptfdisk.mk
@@ -6,6 +6,8 @@
 
 GPTFDISK_VERSION = 0.8.6
 GPTFDISK_SITE = http://downloads.sourceforge.net/sourceforge/gptfdisk
+GPTFDISK_LICENSE = GPLv2+
+GPTFDISK_LICENSE_FILES = COPYING
 
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_GDISK) += gdisk
 GPTFDISK_TARGETS_$(BR2_PACKAGE_GPTFDISK_SGDISK) += sgdisk
