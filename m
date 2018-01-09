From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jan 2018 09:47:43 +0100
Subject: [Buildroot] [git commit] python-networkmanager: remove default
 <pkg>_SOURCE variable
Message-ID: <20180109084809.118F383C6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f4af171d8cb3d87432610c7c87d4ca3ca34b073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<pkg>-<pkg-version>.tar.gz is the default value, so there's no need to
explicitly specify it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-networkmanager/python-networkmanager.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index 7401396..29afb5e 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PYTHON_NETWORKMANAGER_VERSION = 2.0.1
-PYTHON_NETWORKMANAGER_SOURCE = python-networkmanager-$(PYTHON_NETWORKMANAGER_VERSION).tar.gz
 PYTHON_NETWORKMANAGER_SITE = https://pypi.python.org/packages/d7/f9/5cbd99fd24a072875ce048e48d1754285f137aab447de8fee63b6cba990a
 PYTHON_NETWORKMANAGER_SETUP_TYPE = setuptools
 PYTHON_NETWORKMANAGER_LICENSE = Zlib
