From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:03:16 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] python-setproctitle:
	change setup type to setuptools
Message-ID: <20170720055507.25C1D800CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33145a32b2aeeb57ffb42b14caa320b6dd434ece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Changing setup type to setuptools avoids installing as zipped .egg

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 37cb6e971c77c376b9329cbda93e3d03aa90ce15)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setproctitle/python-setproctitle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-setproctitle/python-setproctitle.mk b/package/python-setproctitle/python-setproctitle.mk
index 36cfec3..c3c6386 100644
--- a/package/python-setproctitle/python-setproctitle.mk
+++ b/package/python-setproctitle/python-setproctitle.mk
@@ -9,6 +9,6 @@ PYTHON_SETPROCTITLE_SOURCE = setproctitle-$(PYTHON_SETPROCTITLE_VERSION).tar.gz
 PYTHON_SETPROCTITLE_SITE = https://pypi.python.org/packages/5a/0d/dc0d2234aacba6cf1a729964383e3452c52096dc695581248b548786f2b3
 PYTHON_SETPROCTITLE_LICENSE = BSD-3c
 PYTHON_SETPROCTITLE_LICENSE_FILES = COPYRIGHT
-PYTHON_SETPROCTITLE_SETUP_TYPE = distutils
+PYTHON_SETPROCTITLE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
