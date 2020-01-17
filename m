From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 17 Jan 2020 12:02:28 +0100
Subject: [Buildroot] [PATCH v2 2/6] package/gr-osmosdr: bump version to
 support Gnuradio 3.8
In-Reply-To: <20200117110232.31336-1-gwenj@trabucayre.com>
References: <20200117110232.31336-1-gwenj@trabucayre.com>
Message-ID: <20200117110232.31336-2-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Gnuradio 3.8 has break some functions or header. Current gr-osmosdr release does not
support these new features, so moves to latest hash with Gnuradio 3.8 support

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gr-osmosdr/gr-osmosdr.hash | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index d82864d307..cc6bd11dba 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 a5820e80465d895a9b4b73e0ff01924d6b612a9a390bbd3488177379a9539d00 gr-osmosdr-0.1.5.tar.gz
+sha256 48f92dc02b86ce6d299b35db249f2c8099bb45326c979b6225a020a4188e4204  gr-osmosdr-46698a67e7e06419eefaf45c95129c0c12669045.tar.gz
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
 
-- 
2.24.1
