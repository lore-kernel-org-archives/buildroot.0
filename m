From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Mar 2012 17:43:15 +0200
Subject: [Buildroot] [git commit] gawk: bump to version 4.0.1
Message-ID: <20120329154644.7541696997@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11c20ebf77c4320c22ee5b97732fbfd6b5269106
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gawk/gawk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index f1a6472..8f374cb 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GAWK_VERSION = 4.0.0
+GAWK_VERSION = 4.0.1
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_TARGET_BINS = awk gawk igawk pgawk
 
