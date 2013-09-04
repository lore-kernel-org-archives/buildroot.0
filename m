From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Sep 2013 00:17:24 +0200
Subject: [Buildroot] [git commit] cppcms: bump to version 1.0.4
Message-ID: <20130904221730.CD3179A49F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f0b9a683f3b003c7184564c1118639bf6ae9a43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cppcms/cppcms.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 8d4a519..4068df7 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPCMS_VERSION = 1.0.3
+CPPCMS_VERSION = 1.0.4
 CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
 CPPCMS_LICENSE = LGPLv3
 CPPCMS_LICENSE_FILES = COPYING.TXT
