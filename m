From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 22:00:48 +0100
Subject: [Buildroot] [git commit] squid: bump to version 3.2.4
Message-ID: <20121209210035.EC1399A157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f83339e66290df412603e5694d2ac8e0456efa76
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squid/squid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 1ccb2da..3c08c39 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.2.3
+SQUID_VERSION = 3.2.4
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.2
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
