From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Sep 2013 11:09:50 +0200
Subject: [Buildroot] [git commit] python-pyzmq: use http instead of https to
	retrieve tarball
Message-ID: <20130920091109.8182D9B808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8802aeefb1a8d1b403fc13c150bef039e378e026
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Older wget versions have issues with the ssl certificate, so use http
instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python-pyzmq/python-pyzmq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index a281aed..e9702fc 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYZMQ_VERSION = 13.1.0
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://pypi.python.org/packages/source/p/pyzmq/
+PYTHON_PYZMQ_SITE = http://pypi.python.org/packages/source/p/pyzmq/
 PYTHON_PYZMQ_LICENSE = LGPLv3+ BSD-3c Apache License Version 2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
 PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
