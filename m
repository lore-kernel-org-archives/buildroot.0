From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Dec 2012 07:21:56 +0100
Subject: [Buildroot] [git commit] efl/libedje: bump to version 1.7.4
Message-ID: <20121230112955.3CAFE9A52C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=acb2d8cd0b0b9b19ef73d22f2a46172f49e31029
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/libedje/libedje.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/efl/libedje/libedje.mk b/package/efl/libedje/libedje.mk
index ce17da5..a02eaa9 100644
--- a/package/efl/libedje/libedje.mk
+++ b/package/efl/libedje/libedje.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBEDJE_VERSION = 1.1.0
+LIBEDJE_VERSION = 1.7.4
 LIBEDJE_SOURCE = edje-$(LIBEDJE_VERSION).tar.bz2
 LIBEDJE_SITE =  http://download.enlightenment.org/releases/
 LIBEDJE_LICENSE = GPLv2+ (epp binary), BSD-2c (everything else)
