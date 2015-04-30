From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 30 Apr 2015 13:29:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: bump to version 1.58.0
Message-ID: <1430393361-27646-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/boost/boost.hash | 6 +++---
 package/boost/boost.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/boost/boost.hash b/package/boost/boost.hash
index 2019743..706eea2 100644
--- a/package/boost/boost.hash
+++ b/package/boost/boost.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/boost/files/boost/1.57.0/
-md5	1be49befbdd9a5ce9def2983ba3e7b76	boost_1_57_0.tar.bz2
-sha1	e151557ae47afd1b43dc3fac46f8b04a8fe51c12	boost_1_57_0.tar.bz2
+# From http://sourceforge.net/projects/boost/files/boost/1.58.0/
+md5	b8839650e61e9c1c0a89f371dd475546	boost_1_58_0.tar.bz2
+sha1	2fc96c1651ac6fe9859b678b165bd78dc211e881	boost_1_58_0.tar.bz2
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7060591..c658628 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.57.0
+BOOST_VERSION = 1.58.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
-- 
2.3.7
