From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  6 Jul 2017 10:52:59 +0200
Subject: [Buildroot] [PATCH] python-setproctitle: change setup type to
	setuptools
Message-ID: <20170706085259.14394-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Changing setup type to setuptools avoids installing as zipped .egg

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-setproctitle/python-setproctitle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index b839b5d96e..ff33c0c18a 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -9,6 +9,6 @@ PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
 PYTHON_SETPROCTITLE_SITE = https://pypi.python.org/packages/5a/0d/dc0d2234aacba6cf1a729964383e3452c52096dc695581248b548786f2b3
 PYTHON_SETPROCTITLE_LICENSE = BSD-3-Clause
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
-PYTHON_SETPROCTITLE_SETUP_TYPE = distutils
+PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.11.0
