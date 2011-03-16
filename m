From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 16 Mar 2011 17:09:48 +0100
Subject: [Buildroot] [git commit master 1/1] socat: bump to version 2.0.0-b4
Message-ID: <20110316164034.8ADE99096A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2ea83e9688e084c55fdba18a1e6047512af533aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/socat/socat.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 5714b8f..b110790 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SOCAT_VERSION = 2.0.0-b2
+SOCAT_VERSION = 2.0.0-b4
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download/
 SOCAT_CONF_ENV = sc_cv_termios_ispeed=no \
-- 
1.7.3.4
