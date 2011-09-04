From: Darius Augulis <augulis.darius@gmail.com>
Date: Sun, 04 Sep 2011 15:08:26 +0300
Subject: [Buildroot] [PATCH 1/3] libevent: bump to version 2.0.13
Message-ID: <20110904120826.3974.849.stgit@darius-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Darius Augulis <augulis.darius@gmail.com>
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
 
