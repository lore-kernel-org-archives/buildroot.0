From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue,  6 May 2014 10:42:41 -0500
Subject: [Buildroot] [PATCH 06/11] python-setuptools: add license information
In-Reply-To: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1399390966-9678-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1399390966-9678-7-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
---
 package/python-setuptools/python-setuptools.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 48bf7c5..6ede292 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -7,6 +7,8 @@
 PYTHON_SETUPTOOLS_VERSION = 2.1.2
 PYTHON_SETUPTOOLS_SOURCE  = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
 PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/s/setuptools
+PYTHON_SETUPTOOLS_LICENSE = Python Software Foundation License
+PYTHON_SETUPTOOLS_LICENSE += or Zope Public License
 PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
1.7.9.5
