From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 10:22:29 +0100
Subject: [Buildroot] [git commit] libqmi: bump to 1.6.0
Message-ID: <20131206093441.25A709BF49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bfc9788ad46abdf7542a38e8ded6839f02b5d85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqmi/libqmi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 4f3f9a9..edd11f7 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.4.0
+LIBQMI_VERSION = 1.6.0
 LIBQMI_SITE    = http://www.freedesktop.org/software/libqmi/
 LIBQMI_SOURCE  = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
