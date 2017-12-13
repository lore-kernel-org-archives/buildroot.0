From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Dec 2017 06:33:03 +0100
Subject: [Buildroot] [PATCH 04/11] package/python-ipaddr: switch SITE to
 https
In-Reply-To: <20171213053310.17578-1-bernd.kuhls@t-online.de>
References: <20171213053310.17578-1-bernd.kuhls@t-online.de>
Message-ID: <20171213053310.17578-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/python-ipaddr/python-ipaddr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-ipaddr/python-ipaddr.mk b/package/python-ipaddr/python-ipaddr.mk
index 8bfb543791..84c486dc56 100644
--- a/package/python-ipaddr/python-ipaddr.mk
+++ b/package/python-ipaddr/python-ipaddr.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPADDR_VERSION = 2.1.11
 PYTHON_IPADDR_SOURCE = ipaddr-$(PYTHON_IPADDR_VERSION).tar.gz
-PYTHON_IPADDR_SITE = http://pypi.python.org/packages/source/i/ipaddr
+PYTHON_IPADDR_SITE = https://pypi.python.org/packages/source/i/ipaddr
 PYTHON_IPADDR_SETUP_TYPE = distutils
 PYTHON_IPADDR_LICENSE = Apache-2.0
 PYTHON_IPADDR_LICENSE_FILES = COPYING
-- 
2.11.0
