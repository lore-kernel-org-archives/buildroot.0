From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Apr 2011 22:13:48 +0200
Subject: [Buildroot] [git commit] kismet: bump to version 2011-03-R2
Message-ID: <20110427201947.E55648294E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=2c200d5b369378876f85afc222ba7f14b120bbc6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kismet/kismet.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 482c7db..b143ef3 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-KISMET_VERSION = 2010-07-R1
+KISMET_VERSION = 2011-03-R2
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = libpcap ncurses
 
-- 
1.7.3.4
