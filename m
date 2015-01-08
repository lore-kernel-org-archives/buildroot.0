From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:35:43 +0100
Subject: [Buildroot] [git commit] libmbim: bump to 1.10.2
Message-ID: <20150108203844.BDEF78083E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c5c58a19afc716aec8887fc4ce0c992af922dbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add locally computed hash file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmbim/libmbim.hash |    2 ++
 package/libmbim/libmbim.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
new file mode 100644
index 0000000..ac9b70c
--- /dev/null
+++ b/package/libmbim/libmbim.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  c0f6611c1ea726f8801bdf3316cf3fe31772391cd60945373c4c9d128655c7bc  libmbim-1.10.2.tar.xz
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 3613d25..07fb1b6 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.10.0
+LIBMBIM_VERSION = 1.10.2
 LIBMBIM_SITE = http://www.freedesktop.org/software/libmbim
 LIBMBIM_SOURCE = libmbim-$(LIBMBIM_VERSION).tar.xz
 LIBMBIM_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
