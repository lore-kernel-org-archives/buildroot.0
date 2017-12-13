From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:07 +0100
Subject: [Buildroot] [PATCH 08/11] package/python-shutilwhich: switch SITE
 to https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-shutilwhich/python-shutilwhich.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-shutilwhich/python-shutilwhich.mk b/package/python-shutilwhich/python-shutilwhich.mk
index 31a7ea96fa..0cf968a4af 100644
--- a/package/python-shutilwhich/python-shutilwhich.mk
+++ b/package/python-shutilwhich/python-shutilwhich.mk
@@ -6,7 +6,7 @@
 
 PYTHON_SHUTILWHICH_VERSION = 1.1.0
 PYTHON_SHUTILWHICH_SOURCE = shutilwhich-$(PYTHON_SHUTILWHICH_VERSION).tar.gz
-PYTHON_SHUTILWHICH_SITE = http://pypi.python.org/packages/source/s/shutilwhich
+PYTHON_SHUTILWHICH_SITE = https://pypi.python.org/packages/source/s/shutilwhich
 PYTHON_SHUTILWHICH_LICENSE = Python-2.0
 PYTHON_SHUTILWHICH_SETUP_TYPE = setuptools
 
-- 
2.11.0
