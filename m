From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2019 22:13:53 +0100
Subject: [Buildroot] [git commit] package/python-bluezero: Bump to version
 0.3.0
Message-ID: <20191216210523.E028088551@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fafce8fa42828f0b1a145f8bc3e8f009091850cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bluezero/python-bluezero.hash | 4 ++--
 package/python-bluezero/python-bluezero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
index e1adcf5672..738688d7a9 100644
--- a/package/python-bluezero/python-bluezero.hash
+++ b/package/python-bluezero/python-bluezero.hash
@@ -1,3 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/bluezero/json
-md5	b13fd84a5fe98ce9526a6f513c9131b1  bluezero-0.2.0.tar.gz
-sha256	d16eb9ac048665a974ad0db312b23bfd528423000b7b2983566b853d5e0d19b6  bluezero-0.2.0.tar.gz
+md5	eeb444ecaf7c6bd2613d8ff0eb92d0ac  bluezero-0.3.0.tar.gz
+sha256	7ebe7243169b5c7600941cb6aa31bc3f8b475c22f5ac32a94d2b0200d5faf684  bluezero-0.3.0.tar.gz
diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
index 1271b997a9..97b1aeb78d 100644
--- a/package/python-bluezero/python-bluezero.mk
+++ b/package/python-bluezero/python-bluezero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLUEZERO_VERSION = 0.2.0
+PYTHON_BLUEZERO_VERSION = 0.3.0
 PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
-PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/9c/76/8f5250e119be8aff4f7ac3acb9d91589909d8650152fdf6758bfb01f9576
+PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/e4/d8/c5451133c0773a0378cadb6c014d7f03b5786da1d39af2f9eaa8028e6662
 PYTHON_BLUEZERO_SETUP_TYPE = setuptools
 PYTHON_BLUEZERO_LICENSE = MIT
 
