From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 13:27:19 +0200
Subject: [Buildroot] [git commit] python-pyasn: update license information
Message-ID: <20140507120710.B26419CA29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b352f22813cf3d037cba24ba4a8fe2bc903760b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Correct license information after switch to correct package on commit
5aa4f71b51a3713d765b0e430fc34abecd0bea93.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyasn/python-pyasn.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index a5f801e..b44a56a 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -7,7 +7,8 @@
 PYTHON_PYASN_VERSION = 0.1.7
 PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
 PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1/
-PYTHON_PYASN_LICENSE = LGPLv3+ (pyasn.cpp), GPLv2+ (libgds)
+PYTHON_PYASN_LICENSE = BSD-2c
+PYTHON_PYASN_LICENSE_FILES = LICENSE
 PYTHON_PYASN_SETUP_TYPE = distutils
 
 $(eval $(python-package))
