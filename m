From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Dec 2019 22:22:44 +0100
Subject: [Buildroot] [git commit] package/gr-osmosdr: bump to version 0.1.5
Message-ID: <20191202211933.77A5283A1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93013e9b85d3b0b0cf22832c1b6f616272c28311
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gr-osmosdr/gr-osmosdr.hash | 3 ++-
 package/gr-osmosdr/gr-osmosdr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index 337f3ef86b..d82864d307 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,2 +1,3 @@
 # Locally calculated:
-sha256 274960cd32bc8a7216eeed8967bf078efd6123332808b405ec42c24a7e426b7c gr-osmosdr-164a09fc11cec2d8b15b38e8b512fa542d6cecc7.tar.gz
+sha256 a5820e80465d895a9b4b73e0ff01924d6b612a9a390bbd3488177379a9539d00 gr-osmosdr-0.1.5.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 9ed4ad3118..645c156e7a 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GR_OSMOSDR_VERSION = 164a09fc11cec2d8b15b38e8b512fa542d6cecc7
-GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,$(GR_OSMOSDR_VERSION))
+GR_OSMOSDR_VERSION = 0.1.5
+GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,v$(GR_OSMOSDR_VERSION))
 GR_OSMOSDR_LICENSE = GPL-3.0+
 GR_OSMOSDR_LICENSE_FILES = COPYING
 
