From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jun 2012 14:15:54 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.1.20
Message-ID: <20120623122030.773738A30D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fdc2a34ca8e9cedc7f0be59ed6ac999538c9a9a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squid/squid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 9cdbeb5..9db2197 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.1.19
+SQUID_VERSION = 3.1.20
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.1
 SQUID_DEPENDENCIES = libcap host-libcap
 SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
