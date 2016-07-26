From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 26 Jul 2016 16:47:42 +0200
Subject: [Buildroot] [PATCH 2/3] libqmi: bump to version 1.16.0
In-Reply-To: <1469544463-19881-1-git-send-email-yegorslists@googlemail.com>
References: <1469544463-19881-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1469544463-19881-2-git-send-email-yegorslists@googlemail.com>
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
index 4a335b6..08da1ae 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  6283b80aea1b2721523e5229087764b4d6a1c9f53488690fa16a11adff4a0040  libqmi-1.14.2.tar.xz
+sha256  7ab6bb47fd23bf4d3fa17424e40ea5552d08b19e5ee4f125f21f316c8086ba2a  libqmi-1.16.0.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 7c46037..825493e 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.14.2
+LIBQMI_VERSION = 1.16.0
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
-- 
2.1.4
