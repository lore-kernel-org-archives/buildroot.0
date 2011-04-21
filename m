From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Apr 2011 10:27:17 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 2.6.38
Message-ID: <20110421082832.DEE46828F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=23f3b883ee6c4e1309557c1310af98855f171869
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...nal-ipv6.patch => iproute2-optional-ipv6.patch} |    0
 package/iproute2/iproute2.mk                       |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename package/iproute2/{iproute2-2.6.37-optional-ipv6.patch => iproute2-optional-ipv6.patch} (100%)

diff --git a/package/iproute2/iproute2-2.6.37-optional-ipv6.patch b/package/iproute2/iproute2-optional-ipv6.patch
similarity index 100%
rename from package/iproute2/iproute2-2.6.37-optional-ipv6.patch
rename to package/iproute2/iproute2-optional-ipv6.patch
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index dfb8410..630fab4 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 2.6.37
+IPROUTE2_VERSION = 2.6.38
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
 IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
-- 
1.7.3.4
