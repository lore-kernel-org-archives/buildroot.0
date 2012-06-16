From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 16 Jun 2012 22:17:09 +0200
Subject: [Buildroot] [git commit] bind: security bump to version
	9.6-ESV-R7-P1
Message-ID: <20120616203821.B22FD96F46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb29c78a634bc50e320d0ad61d7753719bb208b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump bind to version 9.6-ESV-R7-P1.
Fixes CVE-2012-667.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/bind/bind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index eb7b9c0..88f79de 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BIND_VERSION = 9.6-ESV-R7
+BIND_VERSION = 9.6-ESV-R7-P1
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_MAKE = $(MAKE1)
 BIND_TARGET_SBINS = lwresd named named-checkconf named-checkzone
