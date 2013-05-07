From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 23:01:33 +0200
Subject: [Buildroot] [git commit] gperf: add license information
Message-ID: <20130507210348.8CDBA99CCB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d189957b5d50b96a7257f97489a175749d0e6b25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gperf/gperf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/gperf/gperf.mk b/package/gperf/gperf.mk
index 1254f0c..59c5a09 100644
--- a/package/gperf/gperf.mk
+++ b/package/gperf/gperf.mk
@@ -6,6 +6,8 @@
 
 GPERF_VERSION = 3.0.4
 GPERF_SITE = $(BR2_GNU_MIRROR)/gperf
+GPERF_LICENSE = GPLv3+
+GPERF_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
