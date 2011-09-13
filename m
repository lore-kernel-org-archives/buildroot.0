From: Darius Augulis <augulis.darius@gmail.com>
Date: Tue, 13 Sep 2011 23:44:59 +0200
Subject: [Buildroot] [git commit] libevent: bump to version 2.0.13
Message-ID: <20110913214742.644898D59E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9136457992c1967e8dce70de8abf0fc9878f4d8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libevent/libevent.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index ba9769f..fa66f57 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -3,7 +3,7 @@
 # libevent
 #
 #############################################################
-LIBEVENT_VERSION = 1.4.12
+LIBEVENT_VERSION = 2.0.13
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_SITE = http://monkey.org/~provos/
 
-- 
1.7.3.4
