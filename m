From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  8 Apr 2016 12:14:14 +0200
Subject: [Buildroot] [PATCH] libqmi: bump to version 1.14.2
Message-ID: <1460110454-31897-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index be7b955..4a335b6 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  6618fb92ffe6d017d7fd18082b5c13da954c3c9060f7cc4f8807ba7b2bea349d  libqmi-1.14.0.tar.xz
+sha256  6283b80aea1b2721523e5229087764b4d6a1c9f53488690fa16a11adff4a0040  libqmi-1.14.2.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 9492787..7c46037 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.14.0
+LIBQMI_VERSION = 1.14.2
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
2.1.4
