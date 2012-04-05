From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 14:44:29 +0200
Subject: [Buildroot] [git commit] bind: security bump to 9.6-ESV-R6
Message-ID: <20120405124505.BC62B96A14@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b333ffe81ccf36d635c8889e094d1b4fc98fae9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Correct fix for CVE-2011-4313
9.6-ESV-R5-P1 used a restart workaround.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0de986d..987bd4e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BIND_VERSION = 9.6-ESV-R5-P1
+BIND_VERSION = 9.6-ESV-R6
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
