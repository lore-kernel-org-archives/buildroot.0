From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 13:51:57 +0200
Subject: [Buildroot] [git commit] make version update 3.82
Message-ID: <20130506115311.40BB099C41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88429e0a62d2bf28d61dc05c6b0fd6fb25488ba1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/make/make.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/make/make.mk b/package/make/make.mk
index b67f944..25bc5fa 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MAKE_VERSION = 3.81
+MAKE_VERSION = 3.82
 MAKE_SOURCE = make-$(MAKE_VERSION).tar.bz2
 MAKE_SITE = $(BR2_GNU_MIRROR)/make
 
