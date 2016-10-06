From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  6 Oct 2016 21:29:42 +0200
Subject: [Buildroot] [PATCH 15/21] package/python-tornado: bump version to
	4.4.2
In-Reply-To: <20161006192948.27956-1-bernd.kuhls@t-online.de>
References: <20161006192948.27956-1-bernd.kuhls@t-online.de>
Message-ID: <20161006192948.27956-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 27385a5..ee4080f 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/tornado/json, sha256 locally computed
-md5     fff8a7d7f580b04bacc2ffe7ddf41133 tornado-4.4.1.tar.gz
-sha256  371d0cf3d56c47accc66116a77ad558d76eebaa8458a6b677af71ca606522146  tornado-4.4.1.tar.gz
+md5	b4816ea209118667ffc52ce9ff06ac85  tornado-4.4.2.tar.gz
+sha256	2898f992f898cd41eeb8d53b6df75495f2f423b6672890aadaf196ea1448edcc  tornado-4.4.2.tar.gz
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index 98d42b5..e512e60 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 4.4.1
+PYTHON_TORNADO_VERSION = 4.4.2
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://pypi.python.org/packages/96/5d/ff472313e8f337d5acda5d56e6ea79a43583cc8771b34c85a1f458e197c3
+PYTHON_TORNADO_SITE = https://pypi.python.org/packages/1e/7c/ea047f7bbd1ff22a7f69fe55e7561040e3e54d6f31da6267ef9748321f98
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_SETUP_TYPE = setuptools
 
-- 
2.9.3
