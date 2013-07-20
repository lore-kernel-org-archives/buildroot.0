From: Rohan Fletcher <rohfledev@gmail.com>
Date: Sat, 20 Jul 2013 22:27:12 +1200
Subject: [Buildroot] [PATCH 1/3] python-setuptools: bumped version to 0.8
Message-ID: <1374316034-31973-1-git-send-email-rohfledev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Rohan Fletcher <rohfledev@gmail.com>
---
 package/python-setuptools/python-setuptools.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index cd5ee4d..48b934b 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -9,9 +9,9 @@
 # switch back to it.
 # See http://pypi.python.org/packages/source/s/setuptools
 
-PYTHON_SETUPTOOLS_VERSION = 0.6.36
-PYTHON_SETUPTOOLS_SOURCE  = distribute-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/d/distribute
+PYTHON_SETUPTOOLS_VERSION = 0.8
+PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
 PYTHON_SETUPTOOLS_DEPENDENCIES = python
 
 define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
-- 
1.8.1.2
