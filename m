From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Apr 2017 10:45:21 +0100
Subject: [Buildroot] [PATCH] x265: bump version to 2.4
Message-ID: <20170424094521.63027-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/x265/x265.hash | 2 +-
 package/x265/x265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index d53295c..1ad8170 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 47520ac3424790168ea5c2db4a3cf12ca4d55a1790720007916652f07af3e41f  x265_2.3.tar.gz
+sha256 9c2aa718d78f6fecdd783f08ab83b98d3169e5f670404da4c16439306907d729  x265_2.4.tar.gz
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 2ea404b..2907ba3 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 2.3
+X265_VERSION = 2.4
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPL-2.0+
-- 
2.10.2
