From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:09 +0100
Subject: [Buildroot] [PATCH 10/11] package/python-versiontools: switch SITE
 to https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-11-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-versiontools/python-versiontools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-versiontools/python-versiontools.mk b/package/python-versiontools/python-versiontools.mk
index fbf104023e..b99ddecb8f 100644
--- a/package/python-versiontools/python-versiontools.mk
+++ b/package/python-versiontools/python-versiontools.mk
@@ -6,7 +6,7 @@
 
 PYTHON_VERSIONTOOLS_VERSION = 1.9.1
 PYTHON_VERSIONTOOLS_SOURCE = versiontools-$(PYTHON_VERSIONTOOLS_VERSION).tar.gz
-PYTHON_VERSIONTOOLS_SITE = http://pypi.python.org/packages/source/v/versiontools
+PYTHON_VERSIONTOOLS_SITE = https://pypi.python.org/packages/source/v/versiontools
 PYTHON_VERSIONTOOLS_SETUP_TYPE = setuptools
 PYTHON_VERSIONTOOLS_LICENSE = LGPL-3.0
 
-- 
2.11.0
