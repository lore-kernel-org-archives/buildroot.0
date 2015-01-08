From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:36:55 +0100
Subject: [Buildroot] [git commit] libqmi: bump to 1.10.6
Message-ID: <20150108203844.C9D0F7FC88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9c69675528b512b1da41f74b38584eb8e7a287b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add locally computed hash file.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libqmi/libqmi.hash |    2 ++
 package/libqmi/libqmi.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
new file mode 100644
index 0000000..a42aebc
--- /dev/null
+++ b/package/libqmi/libqmi.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  963cce068968d749e22973dce0afc05543915e4accea736963a7d426f6b29a80  libqmi-1.10.6.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index b083aea..dd87d73 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.10.4
+LIBQMI_VERSION = 1.10.6
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
