From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jun 2016 21:36:59 +0200
Subject: [Buildroot] [git commit] package/gr-osmosdr: bump version
Message-ID: <20160605200530.35B817FB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d53542a859e0c80a07f8d77d96d7511764e41b2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gr-osmosdr/gr-osmosdr.hash | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index ce6e84a..337f3ef 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,2 +1,2 @@
 # Locally calculated:
-sha256 d40462dddc0ebd769b2df3c6ad6fe82c9e9a4a73f7b3c5ce53efbce724906290 gr-osmosdr-a45968f3381f33b86ca344bb76bd62c131d98d93.tar.gz
+sha256 274960cd32bc8a7216eeed8967bf078efd6123332808b405ec42c24a7e426b7c gr-osmosdr-164a09fc11cec2d8b15b38e8b512fa542d6cecc7.tar.gz
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 6a0cc26..d7c3d62 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GR_OSMOSDR_VERSION = a45968f3381f33b86ca344bb76bd62c131d98d93
+GR_OSMOSDR_VERSION = 164a09fc11cec2d8b15b38e8b512fa542d6cecc7
 GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,$(GR_OSMOSDR_VERSION))
 GR_OSMOSDR_LICENSE = GPLv3+
 GR_OSMOSDR_LICENSE_FILES = COPYING
