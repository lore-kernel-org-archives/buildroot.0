From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 13:48:25 +0200
Subject: [Buildroot] [git commit] python-shutilwhich: add version to license
	string
Message-ID: <20170409115341.65157826E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a2af56464f186a55645cc273a483524b1cb24a23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE file refers to Python license version 2. Use SPDX short
identifier for license string while at it.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-shutilwhich/python-shutilwhich.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-shutilwhich/python-shutilwhich.mk b/package/python-shutilwhich/python-shutilwhich.mk
index 0497e1b..31a7ea9 100644
--- a/package/python-shutilwhich/python-shutilwhich.mk
+++ b/package/python-shutilwhich/python-shutilwhich.mk
@@ -7,7 +7,7 @@
 PYTHON_SHUTILWHICH_VERSION = 1.1.0
 PYTHON_SHUTILWHICH_SOURCE = shutilwhich-$(PYTHON_SHUTILWHICH_VERSION).tar.gz
 PYTHON_SHUTILWHICH_SITE = http://pypi.python.org/packages/source/s/shutilwhich
-PYTHON_SHUTILWHICH_LICENSE = Python Software Foundation License
+PYTHON_SHUTILWHICH_LICENSE = Python-2.0
 PYTHON_SHUTILWHICH_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
