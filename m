From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Jan 2014 21:06:21 +0100
Subject: [Buildroot] [git commit] squid: bump to version 3.4.2
Message-ID: <20140104200732.CAF759C3A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0b73a9d3e7a3cd3b8c63f4b010d7ec46b07236b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 0b303dd..7f1f0f5 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQUID_VERSION_MAJOR = 3.4
-SQUID_VERSION = $(SQUID_VERSION_MAJOR).1
+SQUID_VERSION = $(SQUID_VERSION_MAJOR).2
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/$(SQUID_VERSION_MAJOR)
 SQUID_LICENSE = GPLv2+
