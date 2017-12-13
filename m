From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:10 +0100
Subject: [Buildroot] [PATCH 11/11] package/python-wsaccel:switch SITE to
 https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-12-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-wsaccel/python-wsaccel.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 3e7b3324b9..016ff2d72a 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -6,7 +6,7 @@
 
 PYTHON_WSACCEL_VERSION = 0.6.2
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = http://pypi.python.org/packages/source/w/wsaccel
+PYTHON_WSACCEL_SITE = https://pypi.python.org/packages/source/w/wsaccel
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
 
-- 
2.11.0
