From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 Jun 2014 07:51:35 -0300
Subject: [Buildroot] [PATCH] python-bottle: security bump to version 0.12.7
Message-ID: <1401965495-16738-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-3137.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-bottle/python-bottle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 58c51f9..441419e 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.11.6
+PYTHON_BOTTLE_VERSION = 0.12.7
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
 PYTHON_BOTTLE_SITE = http://pypi.python.org/packages/source/b/bottle
 PYTHON_BOTTLE_LICENSE = MIT
-- 
1.8.5.5
