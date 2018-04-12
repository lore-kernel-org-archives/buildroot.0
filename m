From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 11 Apr 2018 22:23:45 -0400
Subject: [Buildroot] [PATCH 1/1] xcb-util: bump to version 0.4.0
Message-ID: <1523499825-28310-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

The code itself is hardly changed, but the updated package now
has a license file, so it is nice to clear the legal-info warning,
---
 package/x11r7/xcb-util/xcb-util.hash | 3 ++-
 package/x11r7/xcb-util/xcb-util.mk   | 6 ++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xcb-util/xcb-util.hash b/package/x11r7/xcb-util/xcb-util.hash
index a9b8be2..c088a62 100644
--- a/package/x11r7/xcb-util/xcb-util.hash
+++ b/package/x11r7/xcb-util/xcb-util.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256  c611259c0ab20fd76f79f48f4684843c18ea9c967eba78a45e8b3636315c18c4  xcb-util-0.3.9.tar.bz2
+sha256  46e49469cb3b594af1d33176cd7565def2be3fa8be4371d62271fabb5eae50e9  xcb-util-0.4.0.tar.bz2
+sha256  325b64f0b0284e08bbb7a78ae3e55c1edc2a7cd77f603225ae4b8ffc35423e37  COPYING
diff --git a/package/x11r7/xcb-util/xcb-util.mk b/package/x11r7/xcb-util/xcb-util.mk
index 7b913e2..bb73530 100644
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
 
-- 
2.7.4
