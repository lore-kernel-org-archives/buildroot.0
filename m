From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:56:41 +0100
Subject: [Buildroot] [git commit] boost: bump to version 1.57.0
Message-ID: <20141218220056.7229F7FED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6483d26b49f4435cb40f1ad208c5b594d36a50b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/boost.hash |    3 +++
 package/boost/boost.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

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
