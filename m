From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Sep 2013 10:13:47 +0200
Subject: [Buildroot] [git commit] libevent: Bump to 2.0.21
Message-ID: <20130925092155.D10C39B881@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b088752be330e3ff4f2a284e6067d439a4d4ae5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the build on ARC as well, as 2.0.17+ includes a fix
that checks for existence of 'sysctl'.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libevent/libevent.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 94882b5..a6def1a 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEVENT_VERSION = 2.0.14
+LIBEVENT_VERSION = 2.0.21
 LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
 LIBEVENT_SITE = https://github.com/downloads/libevent/libevent
 LIBEVENT_INSTALL_STAGING = YES
