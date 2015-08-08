From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:11 -0000
Subject: [Buildroot] [git commit branch/next] python-pyxml: add
	PYTHON_PYXML_VERSION variable to url address
Message-ID: <20150808105608.AA2B37FB02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=efb58de1804b3dcc42cb963590ff9da54db65f0e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyxml/python-pyxml.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/python-pyxml/python-pyxml.mk b/package/python-pyxml/python-pyxml.mk
index 77863f5..40435f4 100644
--- a/package/python-pyxml/python-pyxml.mk
+++ b/package/python-pyxml/python-pyxml.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYXML_VERSION = 0.8.4
 PYTHON_PYXML_SOURCE = PyXML-$(PYTHON_PYXML_VERSION).tar.gz
-PYTHON_PYXML_SITE = http://downloads.sourceforge.net/project/pyxml/pyxml/0.8.4/
+PYTHON_PYXML_SITE = http://downloads.sourceforge.net/project/pyxml/pyxml/$(PYTHON_PYXML_VERSION)/
 PYTHON_PYXML_LICENSE = BSD-3c
 PYTHON_PYXML_LICENSE_FILES = LICENCE
 PYTHON_PYXML_SETUP_TYPE = distutils
