From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 May 2017 21:15:49 +0200
Subject: [Buildroot] [git commit] python-tornado: bump to version 4.5.1
Message-ID: <20170505191911.31AA3828F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cad2f2c6f2882b30a424edfacbc3e9f02c44e1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index ee4080f..662db6f 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/tornado/json, sha256 locally computed
-md5	b4816ea209118667ffc52ce9ff06ac85  tornado-4.4.2.tar.gz
-sha256	2898f992f898cd41eeb8d53b6df75495f2f423b6672890aadaf196ea1448edcc  tornado-4.4.2.tar.gz
+md5	838687d20923360af5ab59f101e9e02e  tornado-4.5.1.tar.gz
+sha256	db0904a28253cfe53e7dedc765c71596f3c53bb8a866ae50123320ec1a7b73fd  tornado-4.5.1.tar.gz
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index e512e60..6e61675 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 4.4.2
+PYTHON_TORNADO_VERSION = 4.5.1
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://pypi.python.org/packages/1e/7c/ea047f7bbd1ff22a7f69fe55e7561040e3e54d6f31da6267ef9748321f98
+PYTHON_TORNADO_SITE = https://pypi.python.org/packages/df/42/a180ee540e12e2ec1007ac82a42b09dd92e5461e09c98bf465e98646d187
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_SETUP_TYPE = setuptools
 
