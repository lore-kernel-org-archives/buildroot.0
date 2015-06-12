From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Fri, 12 Jun 2015 08:00:45 +0200
Subject: [Buildroot] [PATCH 2/2] python-pyxml: add PYTHON_PYXML_VERSION
	variable to url address
In-Reply-To: <1434088845-2806-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1434088845-2806-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1434088845-2806-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/python-pyxml/python-pyxml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyxml/python-pyxml.mk b/package/python-pyxml/python-pyxml.mk
index 77863f5..15754ee 100644
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
-- 
1.9.1
