From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Jun 2014 21:22:19 +0200
Subject: [Buildroot] [git commit] python-bottle: security bump to version
	0.12.7
Message-ID: <20140605201506.961F99CEB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70bd2d9ab5ca4261cade36aa671675dea52688b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-3137.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bottle/python-bottle.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
