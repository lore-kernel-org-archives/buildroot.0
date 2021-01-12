From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Tue, 12 Jan 2021 10:34:21 +0100
Subject: [Buildroot] [PATCH] package/gr-osmosdr: bump to 0.2.3
Message-ID: <1610444061-29427-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Bump to 0.2.3 and fix hash space.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gr-osmosdr/gr-osmosdr.hash | 4 ++--
 package/gr-osmosdr/gr-osmosdr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index 2acd85f32b..95f1137e38 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  5a7ce7afee38a56191b5d16cb4a91c92476729ff16ed09cbba5a3851ac619713 gr-osmosdr-0.2.2.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256  11b1eb13725ced5ded9121a10aaf7bccf2430c5c69d020791408219968665b71  gr-osmosdr-0.2.3.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 919b43961a..870db60c55 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GR_OSMOSDR_VERSION = 0.2.2
+GR_OSMOSDR_VERSION = 0.2.3
 GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,v$(GR_OSMOSDR_VERSION))
 GR_OSMOSDR_LICENSE = GPL-3.0+
 GR_OSMOSDR_LICENSE_FILES = COPYING
-- 
2.20.1
