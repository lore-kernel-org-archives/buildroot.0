From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 23:43:33 +0100
Subject: [Buildroot] [git commit] package/gr-osmosdr: bump version to
 support Gnuradio 3.8
Message-ID: <20200203223239.D611D8143E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcfc18c9fe34feea6335b044f38465bfb22071ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gnuradio 3.8 has made some API changes. The current gr-osmosdr release
does not support these changes, so move to a more recent gr-osmosdr
commit, which has Gnuradio 3.8 support.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gr-osmosdr/gr-osmosdr.hash | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index d82864d307..4a1e56abae 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 a5820e80465d895a9b4b73e0ff01924d6b612a9a390bbd3488177379a9539d00 gr-osmosdr-0.1.5.tar.gz
+sha256 48f92dc02b86ce6d299b35db249f2c8099bb45326c979b6225a020a4188e4204 gr-osmosdr-46698a67e7e06419eefaf45c95129c0c12669045.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 645c156e7a..98b6e25012 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GR_OSMOSDR_VERSION = 0.1.5
-GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,v$(GR_OSMOSDR_VERSION))
+GR_OSMOSDR_VERSION = 46698a67e7e06419eefaf45c95129c0c12669045
+GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,$(GR_OSMOSDR_VERSION))
 GR_OSMOSDR_LICENSE = GPL-3.0+
 GR_OSMOSDR_LICENSE_FILES = COPYING
 
