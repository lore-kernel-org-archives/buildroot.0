From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:25:21 +0200
Subject: [Buildroot] [git commit] libogg: version bump 1.3.1
Message-ID: <20140403192648.897EE9B795@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98cc6e8fcd8e714baaacac62c583c71e28fd2985
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libogg/libogg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 23554d9..984e7b7 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOGG_VERSION = 1.3.0
+LIBOGG_VERSION = 1.3.1
 LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.xz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_LICENSE = BSD-3c
