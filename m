From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:55 +0100
Subject: [Buildroot] [git commit] package/python-ujson: switch SITE to https
Message-ID: <20171213070253.DD03182BDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc2edb128767e82d393130ba4c583ed793afb752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ujson/python-ujson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 0a2184e..60a4ecf 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -6,7 +6,7 @@
 
 PYTHON_UJSON_VERSION = 1.35
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = http://pypi.python.org/packages/source/u/ujson
+PYTHON_UJSON_SITE = https://pypi.python.org/packages/source/u/ujson
 PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_SETUP_TYPE = setuptools
 
