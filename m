From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 19:07:25 +0200
Subject: [Buildroot] [git commit] lzo: define license
Message-ID: <20120717173301.2A18C96A87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1c5597f17731d0816129080c5b51e0a6f117f73c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lzo/lzo.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 84f31f0..da5d6b7 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -5,6 +5,8 @@
 #############################################################
 LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
+LZO_LICENSE = GPLv2+
+LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
