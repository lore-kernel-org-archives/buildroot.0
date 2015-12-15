From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:39:40 +0100
Subject: [Buildroot] [git commit] python-pyasn: fix license file
Message-ID: <20151215203946.E629880142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5936822be13db38af0c9e0bf6805186543195689
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's not LICENSE.txt and not LICENSE, fixes:
http://autobuild.buildroot.net/results/d29/d293f35d8034eaaa519565b14641d1b56206cbc8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn/python-pyasn.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index 8b10958..80d18cd 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -8,7 +8,7 @@ PYTHON_PYASN_VERSION = 0.1.9
 PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
 PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1
 PYTHON_PYASN_LICENSE = BSD-2c
-PYTHON_PYASN_LICENSE_FILES = LICENSE
+PYTHON_PYASN_LICENSE_FILES = LICENSE.txt
 PYTHON_PYASN_SETUP_TYPE = distutils
 
 $(eval $(python-package))
