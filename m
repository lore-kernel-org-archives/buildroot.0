From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 08:53:31 +0100
Subject: [Buildroot] [git commit] python-setuptools: bump version to 2.1.2
Message-ID: <20140228133414.9994F9BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e51f87b825819986613cff58038b797e9925b25d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: bump to 2.1.2 instead of 0.8, remove comment that no longer
made sense about setuptools being forked.]

Signed-off-by: Rohan Fletcher <rohfledev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/python-setuptools.mk |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 13df448..48bf7c5 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,14 +4,9 @@
 #
 ################################################################################
 
-# "distribute" is a fork of the unmaintained setuptools package. There
-# are plans to re-merge it into setuptools; if this happens, we can
-# switch back to it.
-# See http://pypi.python.org/packages/source/s/setuptools
-
-PYTHON_SETUPTOOLS_VERSION = 0.6.36
-PYTHON_SETUPTOOLS_SOURCE  = distribute-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/d/distribute
+PYTHON_SETUPTOOLS_VERSION = 2.1.2
+PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
