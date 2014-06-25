From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Jun 2014 23:08:08 +0200
Subject: [Buildroot] [git commit] open2300: add license information
Message-ID: <20140625211214.350AD9D0C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bcada4520dbec8d2e12331915ca4948f5ab4aaf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open2300/open2300.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/open2300/open2300.mk b/package/open2300/open2300.mk
index a89c9a2..307fffe 100644
--- a/package/open2300/open2300.mk
+++ b/package/open2300/open2300.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-OPEN2300_SITE        = http://www.lavrsen.dk/svn/open2300/trunk/
+OPEN2300_SITE = http://www.lavrsen.dk/svn/open2300/trunk/
 OPEN2300_SITE_METHOD = svn
-OPEN2300_VERSION     = 12
+OPEN2300_VERSION = 12
+OPEN2300_LICENSE = GPLv2
+OPEN2300_LICENSE_FILES = COPYING
 
 OPEN2300_BINS = open2300 dump2300 log2300 fetch2300 wu2300 cw2300 history2300 \
 		histlog2300 bin2300 xml2300 light2300 interval2300 minmax2300
