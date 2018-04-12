From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:16:58 +0200
Subject: [Buildroot] [git commit] xcb-util: bump to version 0.4.0
Message-ID: <20180412191700.0447780FFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91abb28f750d695fbc4ce2a95220e4b996617cf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xcb-util/xcb-util.hash | 3 ++-
 package/x11r7/xcb-util/xcb-util.mk   | 6 ++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xcb-util/xcb-util.hash b/package/x11r7/xcb-util/xcb-util.hash
index a9b8be25ab..c088a62bab 100644
--- a/package/x11r7/xcb-util/xcb-util.hash
+++ b/package/x11r7/xcb-util/xcb-util.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256  c611259c0ab20fd76f79f48f4684843c18ea9c967eba78a45e8b3636315c18c4  xcb-util-0.3.9.tar.bz2
+sha256  46e49469cb3b594af1d33176cd7565def2be3fa8be4371d62271fabb5eae50e9  xcb-util-0.4.0.tar.bz2
+sha256  325b64f0b0284e08bbb7a78ae3e55c1edc2a7cd77f603225ae4b8ffc35423e37  COPYING
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index 7b913e2bb5..bb73530f94 100644
--- a/package/x11r7/xcb-util/xcb-util.mk
+++ b/package/x11r7/xcb-util/xcb-util.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-XCB_UTIL_VERSION = 0.3.9
+XCB_UTIL_VERSION = 0.4.0
 XCB_UTIL_SOURCE = xcb-util-$(XCB_UTIL_VERSION).tar.bz2
 XCB_UTIL_SITE = http://xcb.freedesktop.org/dist
-
-# unfortunately, no license file
 XCB_UTIL_LICENSE = MIT
-
+XCB_UTIL_LICENSE_FILES = COPYING
 XCB_UTIL_INSTALL_STAGING = YES
 XCB_UTIL_DEPENDENCIES = libxcb
 
