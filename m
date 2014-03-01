From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 21:09:39 +0100
Subject: [Buildroot] [git commit] python-pyasn: fix version number to match
	upstream tarball
Message-ID: <20140301201036.8D7D199372@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e025e49100565617715e0de986ba670532098b14
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream tarball at
https://pypi.python.org/packages/source/p/pyasn1/ is actually in
version 0.1.7, not 0.17.

Reported-by: Peter Korsgaard <jacmet@uclibc.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn/python-pyasn.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index 43fabe9..a5f801e 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYASN_VERSION = 0.17
+PYTHON_PYASN_VERSION = 0.1.7
 PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
 PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1/
 PYTHON_PYASN_LICENSE = LGPLv3+ (pyasn.cpp), GPLv2+ (libgds)
