From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Jul 2014 22:32:27 +0200
Subject: [Buildroot] [git commit] python-pyzmq: bump to version 14.3.1
Message-ID: <20140724203249.80E839D2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adceeca6a726d49ff8632ebd79795e75ddfa68a8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

> Warning: Users of Python 3.4 should not use pyzmq < 14.3,
> due to changes in garbage collection.

Plus, there's some interesting stuff in 14.x.

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyzmq/python-pyzmq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index b792ee9..2889241 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 13.1.0
+PYTHON_PYZMQ_VERSION = 14.3.1
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
 PYTHON_PYZMQ_SITE = http://pypi.python.org/packages/source/p/pyzmq/
 PYTHON_PYZMQ_LICENSE = LGPLv3+ BSD-3c Apache-2.0
