From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 May 2014 13:40:49 +0200
Subject: [Buildroot] [git commit] python-setuptools: add license information
Message-ID: <20140507120710.BA80C9CB2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=407db483bad294443f67515485dd8e3bd3e05968
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license on single line, use PKG-INFO as license file]
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/python-setuptools.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 48bf7c5..54a11c4 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -7,6 +7,8 @@
 PYTHON_SETUPTOOLS_VERSION = 2.1.2
 PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
 PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
+PYTHON_SETUPTOOLS_LICENSE = Python Software Foundation or Zope Public License
+PYTHON_SETUPTOOLS_LICENSE_FILES = PKG-INFO
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
