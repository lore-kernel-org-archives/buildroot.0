From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 12 Dec 2012 21:24:20 +0100
Subject: [Buildroot] [git commit] squid: bump to version 3.2.5
Message-ID: <20121212203441.31E0582912@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f610bf0c89d036a0451ecde4dd5627fbe2687ef2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/squid/squid.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 3c08c39..43e2d24 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQUID_VERSION = 3.2.4
+SQUID_VERSION = 3.2.5
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.2
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
