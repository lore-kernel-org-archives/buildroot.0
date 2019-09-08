From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Sep 2019 18:56:18 +0200
Subject: [Buildroot] [git commit] package/gperf: bump to version 3.1
Message-ID: <20190908165430.26F818D4FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e29e1ed5bb5c9c6689ac9e78c46c2d458c00cfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gperf/gperf.hash | 4 +++-
 package/gperf/gperf.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gperf/gperf.hash b/package/gperf/gperf.hash
index 21c76605b5..3d8aafbdca 100644
--- a/package/gperf/gperf.hash
+++ b/package/gperf/gperf.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256	767112a204407e62dbc3106647cf839ed544f3cf5d0f0523aaa2508623aad63e	gperf-3.0.4.tar.gz
+# https://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz.sig
+# with key 93C08C88471097CD
+sha256	588546b945bba4b70b6a3a616e80b4ab466e3f33024a352fc2198112cdbb3ae2	gperf-3.1.tar.gz
 
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 2a6192a48b..4b928a0ebd 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GPERF_VERSION = 3.0.4
+GPERF_VERSION = 3.1
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
 GPERF_LICENSE = GPL-3.0+
 GPERF_LICENSE_FILES = COPYING
