From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 7 Oct 2011 13:12:26 +0200
Subject: [Buildroot] [git commit] libevent: bump version to 2.0.14
Message-ID: <20111007113306.9BE038E289@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8181103018e3d655965866e975bba0143bb66d09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Released 2011-08-31.  Mostly bugfixes.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libevent/libevent.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 31122fe..76fb627 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -3,9 +3,9 @@
 # libevent
 #
 #############################################################
-LIBEVENT_VERSION = 2.0.13
+LIBEVENT_VERSION = 2.0.14
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
-LIBEVENT_SITE = http://monkey.org/~provos/
+LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
 
 LIBEVENT_AUTORECONF = NO
 LIBEVENT_INSTALL_STAGING = YES
