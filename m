From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Jun 2014 09:56:31 -0300
Subject: [Buildroot] [PATCH] python-simplejson: security bump to version
	3.5.3
Message-ID: <1404132991-21520-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No CVE assigned, see https://github.com/simplejson/simplejson/issues/98

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-simplejson/python-simplejson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index eb6287a..3045b4e 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.3.1
+PYTHON_SIMPLEJSON_VERSION = 3.5.3
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
 PYTHON_SIMPLEJSON_SITE = http://pypi.python.org/packages/source/s/simplejson/
 PYTHON_SIMPLEJSON_LICENSE = MIT
-- 
1.8.5.5
