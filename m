From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 18 Dec 2014 18:36:05 -0300
Subject: [Buildroot] [PATCH 1/2] boost: bump to version 1.57.0
Message-ID: <1418938566-19279-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/boost/boost.hash | 3 +++
 package/boost/boost.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/boost/boost.hash

diff --git a/package/boost/boost.hash b/package/boost/boost.hash
new file mode 100644
index 0000000..2019743
--- /dev/null
+++ b/package/boost/boost.hash
@@ -0,0 +1,3 @@
+# From http://sourceforge.net/projects/boost/files/boost/1.57.0/
+md5	1be49befbdd9a5ce9def2983ba3e7b76	boost_1_57_0.tar.bz2
+sha1	e151557ae47afd1b43dc3fac46f8b04a8fe51c12	boost_1_57_0.tar.bz2
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 725463c..7b56827 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOST_VERSION = 1.56.0
+BOOST_VERSION = 1.57.0
 BOOST_SOURCE = boost_$(subst .,_,$(BOOST_VERSION)).tar.bz2
 BOOST_SITE = http://downloads.sourceforge.net/project/boost/boost/$(BOOST_VERSION)
 BOOST_INSTALL_STAGING = YES
-- 
2.0.4
