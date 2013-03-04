From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 20:57:07 +0100
Subject: [Buildroot] [git commit] squid: bump to version 3.3.2
Message-ID: <20130304200436.A2F0E9AEAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63b2ee6b86e2214362bc75cb0363b42d11f15ff5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squid/squid.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 7cae0be..a4093f4 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.2.7
-SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.2
+SQUID_VERSION = 3.3.2
+SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.3
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
 SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
