From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Mar 2014 22:58:42 +0100
Subject: [Buildroot] [git commit] libmbim: bump to 1.8.0
Message-ID: <20140306215851.9ABB19BDB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7fe16abec6d66226c46e2ad4648476f43e00425a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmbim/libmbim.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 305a0a4..3606d71 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.6.0
+LIBMBIM_VERSION = 1.8.0
 LIBMBIM_SITE    = http://www.freedesktop.org/software/libmbim/
 LIBMBIM_SOURCE  = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
