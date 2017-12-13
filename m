From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:05 +0100
Subject: [Buildroot] [PATCH 06/11] package/python-pynacl: switch SITE to
 https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-pynacl/python-pynacl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index e1769b8f70..469ddda474 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYNACL_VERSION = 1.0.1
 PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = http://pypi.python.org/packages/source/P/PyNaCl
+PYTHON_PYNACL_SITE = https://pypi.python.org/packages/source/P/PyNaCl
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
-- 
2.11.0
