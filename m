From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 18 Dec 2012 14:28:02 +0100
Subject: [Buildroot] [git commit] bison: bump to version 2.7
Message-ID: <20121218132915.F0D699A381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e1c22b85e40197a7c40ec41a1763217ffc4ce17
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bison/bison.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index c93f716..31fc22c 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BISON_VERSION = 2.6.3
+BISON_VERSION = 2.7
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
 BISON_LICENSE_FILES = COPYING
