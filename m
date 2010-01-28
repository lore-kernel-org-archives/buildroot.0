From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 28 Jan 2010 16:05:40 +0100
Subject: [Buildroot] [git commit master] Bump iw package to 0.9.19
Message-ID: <20100128150631.8AE3E77719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6455c32d82750585d64e9e8a9a90e5c556673afb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #973.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES          |    1 +
 package/iw/iw.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 48b958f..a4fab3f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -40,6 +40,7 @@
 	#943: Bump sqlite package to 3.6.22
 	#961: Bump dnsmasq to 2.52
 	#967: Bump netstat-nat to 1.4.10
+	#973: Bump iw to 0.9.19
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 3491fec..2dd1cd4 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IW_VERSION = 0.9.18
+IW_VERSION = 0.9.19
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = libnl
-- 
1.6.3.3
