From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:56 +0100
Subject: [Buildroot] [git commit] python-setuptools: remove redundant
	HOST_PYTHON_SETUPTOOLS_DEPENDENCIES
Message-ID: <20120118150408.5A44090387@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbb3879666ab06e8d1bbd853496d56ff2ba9e7ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python-setuptools/python-setuptools.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index b75987b..70ebb85 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -8,8 +8,6 @@ PYTHON_SETUPTOOLS_VERSION = 0.6c11
 PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
 PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
 PYTHON_SETUPTOOLS_DEPENDENCIES = python
-HOST_PYTHON_SETUPTOOLS_DEPENDENCIES = host-python
-
 
 define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
