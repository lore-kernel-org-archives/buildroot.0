From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Jul 2016 21:30:57 +0200
Subject: [Buildroot] [git commit] libqmi: bump to version 1.16.0
Message-ID: <20160726193209.F2CC882119@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c2b7d55c7a53b3c52593dc3464cd65493f2c3ea4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
