From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:37:00 +0100
Subject: [Buildroot] [git commit] package/gr-osmosdr: bump to 0.2.3
Message-ID: <20210118211753.601E188503@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2531230902c47c96043447a0a17fd7a11a56318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to 0.2.3 and fix hash space.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
