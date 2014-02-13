From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Feb 2014 21:49:08 +0100
Subject: [Buildroot] [PATCHv1 19/26] python-setuptools: bump version to 2.1.2
In-Reply-To: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392324555-29246-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392324555-29246-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Rohan Fletcher <rohfledev@gmail.com>

[Thomas: bump to 2.1.2 instead of 0.8, remove comment that no longer
made sense about setuptools being forked.]

Signed-off-by: Rohan Fletcher <rohfledev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-setuptools/python-setuptools.mk | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

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
-- 
1.8.3.2
