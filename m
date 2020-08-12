From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:46:52 +0200
Subject: [Buildroot] [git commit] package/python3-mako: use
 PYTHON3_MAKO_VERSION
Message-ID: <20200812144103.71E6F83598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e44a8a132ba908b22a11a09a7704d4ecddbc98a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3-mako/python3-mako.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python3-mako/python3-mako.mk b/package/python3-mako/python3-mako.mk
index 7b135c110c..0296c68fc6 100644
--- a/package/python3-mako/python3-mako.mk
+++ b/package/python3-mako/python3-mako.mk
@@ -7,7 +7,7 @@
 # Please keep in sync with
 # package/python-mako/python-mako.mk
 PYTHON3_MAKO_VERSION = 1.1.2
-PYTHON3_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
+PYTHON3_MAKO_SOURCE = Mako-$(PYTHON3_MAKO_VERSION).tar.gz
 PYTHON3_MAKO_SITE = https://files.pythonhosted.org/packages/42/64/fc7c506d14d8b6ed363e7798ffec2dfe4ba21e14dda4cfab99f4430cba3a
 PYTHON3_MAKO_SETUP_TYPE = setuptools
 PYTHON3_MAKO_LICENSE = MIT
