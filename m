From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 09:39:02 +0100
Subject: [Buildroot] [git commit] Revert "gawk: bump to version 4.0.2"
Message-ID: <20130205083901.30BFC9A968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5f69736be4156832e22dec583a4721389553142
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 6b307de4f9d6ae806b7cbbf8bc1d412d139d75cf (version part).

Fixes http://autobuild.buildroot.org/results/46828cef48bc1267583ba8174c0e8ee993fac865

As discussed on the list, let's revert this for the 2013.02 release
and then bring it up wiith gawk upstream / try to fix for 2013.05+

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gawk/gawk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 4a21592..366dea7 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GAWK_VERSION = 4.0.2
+GAWK_VERSION = 4.0.1
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_TARGET_BINS = awk gawk igawk pgawk
 GAWK_LICENSE = GPLv3
