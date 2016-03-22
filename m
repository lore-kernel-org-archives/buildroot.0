From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 09:59:37 +0100
Subject: [Buildroot] [git commit] libqmi: bump to version 1.14.0
Message-ID: <20160322085942.377407FB66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5e75d177abf5e574f027279b7bb31d7025f6082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index df0bb0b..be7b955 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  d23a397d9c963f637c99622df74ed08a2ba2276552c21eea1ed1d05eeafc82a7  libqmi-1.12.8.tar.xz
+sha256  6618fb92ffe6d017d7fd18082b5c13da954c3c9060f7cc4f8807ba7b2bea349d  libqmi-1.14.0.tar.xz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 0ff20a6..9492787 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.12.8
+LIBQMI_VERSION = 1.14.0
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPLv2+ (library), GPLv2+ (programs)
