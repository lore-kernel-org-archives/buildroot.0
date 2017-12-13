From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:09:46 +0100
Subject: [Buildroot] [git commit] package/python-pynacl: switch SITE to https
Message-ID: <20171213070253.A37EA7FB30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4629269575d3e3103f61a41ecd4a968a7fe1923
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pynacl/python-pynacl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index e1769b8..469ddda 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -6,7 +6,7 @@
 
 PYTHON_PYNACL_VERSION = 1.0.1
 PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = http://pypi.python.org/packages/source/P/PyNaCl
+PYTHON_PYNACL_SITE = https://pypi.python.org/packages/source/P/PyNaCl
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
