From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Oct 2014 16:23:41 +0200
Subject: [Buildroot] [git commit] package/libogg: bump to version 1.3.2
Message-ID: <20141017142530.61F9EB37E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f72e3a4bb70b5329801addcc3a406050fc1b6af6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libogg/libogg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 984e7b7..8fff529 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOGG_VERSION = 1.3.1
+LIBOGG_VERSION = 1.3.2
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3c
