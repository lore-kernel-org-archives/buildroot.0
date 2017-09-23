From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Sep 2017 10:29:35 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] bind: use http:// instead
	of ftp:// for site
Message-ID: <20170923082536.E27A5802B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f8ed52c552fa58e4fcab3ec157d00af72dba8c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

To avoid issues with firewalls blocking ftp.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 771bb2d58d945ebd2909dc8ca5cccf30f189c581)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 0fca543..4465a2f 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BIND_VERSION = 9.11.2
-BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
+BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
 BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
