From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Oct 2014 15:07:13 +0200
Subject: [Buildroot] [git commit] libqmi: bump to 1.10.4
Message-ID: <20141016060905.78393BD474@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adde74b50f770d45abaad86252539b86019ebdb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libqmi/libqmi.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index ed71972..b083aea 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.10.2
+LIBQMI_VERSION = 1.10.4
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
