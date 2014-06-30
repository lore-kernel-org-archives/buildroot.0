From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jun 2014 23:34:41 +0200
Subject: [Buildroot] [git commit] python-simplejson: security bump to
	version 3.5.3
Message-ID: <20140630213727.E7A139D120@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a660373f2c3d8dd7f4b0fbc61c8e40143e14f5cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No CVE assigned, see https://github.com/simplejson/simplejson/issues/98

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-simplejson/python-simplejson.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
