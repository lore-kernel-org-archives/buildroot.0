From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri,  9 Nov 2012 16:36:43 +0400
Subject: [Buildroot] [PATCH] boost version update 1.52.0
Message-ID: <1352464603-22886-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Alexander Khryukin <alexander@mezon.ru>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 64856bc..e03c81d 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BOOST_VERSION = 1.49.0
+BOOST_VERSION = 1.52.0
 BOOST_FILE_VERSION = $(subst .,_,$(BOOST_VERSION))
 BOOST_SOURCE = boost_$(BOOST_FILE_VERSION).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
-- 
1.7.11.3
