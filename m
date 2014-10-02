From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Oct 2014 19:58:38 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.4.8
Message-ID: <20141002180143.435C89D802@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02efd3994f3c364a99cb1119ad40c579b20c2ccd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash |    3 +++
 package/squid/squid.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
new file mode 100644
index 0000000..295a0fd
--- /dev/null
+++ b/package/squid/squid.hash
@@ -0,0 +1,3 @@
+# From http://www.squid-cache.org/Versions/v3/3.4/squid-3.4.8.tar.xz.asc
+md5	b0c4335447248810169f58ea4d8b204a	squid-3.4.8.tar.xz
+sha1	e2e20414252f315b2912ae32ac084ea07a48133f	squid-3.4.8.tar.xz
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 6dffae8..5681309 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.4
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).7
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).8
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
