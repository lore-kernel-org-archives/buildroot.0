From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Nov 2013 00:23:39 +0100
Subject: [Buildroot] [git commit branch/next] squid: bump to version 3.3.10
Message-ID: <20131112233229.97D149BC19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8b30a3ae0383d5a79924066840654a805fc58e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 8324ba8..c0678ce 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 3.3.9
+SQUID_VERSION = 3.3.10
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.3
 SQUID_LICENSE = GPLv2+
