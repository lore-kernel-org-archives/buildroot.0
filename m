From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:08 +0100
Subject: [Buildroot] [PATCH 09/11] package/python-ujson: switch SITE to https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-10-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-ujson/python-ujson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 0a2184e9c3..60a4ecf841 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -6,7 +6,7 @@
 
 PYTHON_UJSON_VERSION = 1.35
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = http://pypi.python.org/packages/source/u/ujson
+PYTHON_UJSON_SITE = https://pypi.python.org/packages/source/u/ujson
 PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_SETUP_TYPE = setuptools
 
-- 
2.11.0
