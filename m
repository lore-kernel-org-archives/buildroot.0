From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Jan 2021 11:48:10 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/gstreamer1: bump
 version to 1.16.3
Message-ID: <20210122103050.9993A8188A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=087895f23b4d3ab129d8b5f246cde01a790ba596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Bugfix release. For details, see the release notes:
https://gstreamer.freedesktop.org/releases/1.16/#1.16.3

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index dd379e6027..780bfddb25 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.16.2.tar.xz.sha256sum
-sha256 e3f044246783fd685439647373fa13ba14f7ab0b346eadd06437092f8419e94e gstreamer-1.16.2.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.16.3.tar.xz.sha256sum
+sha256 692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7 gstreamer-1.16.3.tar.xz
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 4eb3158b8f..9a3f9dbb52 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.16.2
+GSTREAMER1_VERSION = 1.16.3
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
