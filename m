From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 23:03:28 +0100
Subject: [Buildroot] [git commit] python-thrift: bump to version 0.9.2
Message-ID: <20141208220413.8627F7F968@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=00d53748a896520f20baec6ce77294dddde77439
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following the bump of the thrift package, it makes sense to bump the
python-thrift package as well. Python 3 is still not supported
apparently, so we keep this package a Python 2 only one.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-thrift/python-thrift.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-thrift/python-thrift.mk b/package/python-thrift/python-thrift.mk
index 8abad48..99641b8 100644
--- a/package/python-thrift/python-thrift.mk
+++ b/package/python-thrift/python-thrift.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_THRIFT_VERSION = 0.9.1
+PYTHON_THRIFT_VERSION = 0.9.2
 PYTHON_THRIFT_SOURCE = thrift-$(PYTHON_THRIFT_VERSION).tar.gz
 PYTHON_THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(PYTHON_THRIFT_VERSION)
 PYTHON_THRIFT_LICENSE = Apache-2.0
