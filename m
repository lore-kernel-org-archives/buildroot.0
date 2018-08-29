From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Aug 2018 21:41:30 +0200
Subject: [Buildroot] [git commit branch/next] python-mimeparse: remove
 SOURCE variable
Message-ID: <20180829194157.6B75C8199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15ec125d3db327233d7a293ad38a8964cc163600
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The SOURCE variable has the default value, so it is not necessary, as
reported by check-package:

package/python-mimeparse/python-mimeparse.mk:8: remove default value of _SOURCE variable

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mimeparse/python-mimeparse.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-mimeparse/python-mimeparse.mk b/package/python-mimeparse/python-mimeparse.mk
index dc796988d2..00bb1cf8f4 100644
--- a/package/python-mimeparse/python-mimeparse.mk
+++ b/package/python-mimeparse/python-mimeparse.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PYTHON_MIMEPARSE_VERSION = 1.6.0
-PYTHON_MIMEPARSE_SOURCE = python-mimeparse-$(PYTHON_MIMEPARSE_VERSION).tar.gz
 PYTHON_MIMEPARSE_SITE = https://files.pythonhosted.org/packages/0f/40/ac5f9e44a55b678c3cd881b4c3376e5b002677dbeab6fb3a50bac5d50d29
 PYTHON_MIMEPARSE_SETUP_TYPE = setuptools
 PYTHON_MIMEPARSE_LICENSE = MIT
