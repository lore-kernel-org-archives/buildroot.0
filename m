From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Jan 2015 09:35:02 +0100
Subject: [Buildroot] [git commit] libqmi: bump to 1.12.0
Message-ID: <20150115083519.E01FD80E07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce68134299cd1d9e57c663405776d4a077c2cc4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libqmi/libqmi.hash |    2 +-
 package/libqmi/libqmi.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index a42aebc..df592b1 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  963cce068968d749e22973dce0afc05543915e4accea736963a7d426f6b29a80  libqmi-1.10.6.tar.xz
+sha256  7bf0a5b70a6e8214932ec32c264e59d5290c6bd181fa1341c028a063181f64ff  libqmi-1.12.0.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index dd87d73..7ef1dcf 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.10.6
+LIBQMI_VERSION = 1.12.0
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
