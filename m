From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 13:47:45 +0200
Subject: [Buildroot] [git commit] python-pyyaml: correct license name
Message-ID: <20170409115341.3D33F826E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27fdc59e467e55bff1d5910c64e5381ca2814f5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE file contains MIT license text and README file clearly mentions
pyyaml is released under MIT license.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyyaml/python-pyyaml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 0509a7a..beeaf88 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -8,7 +8,7 @@ PYTHON_PYYAML_VERSION = 3.12
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
 PYTHON_PYYAML_SITE = https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a
 PYTHON_PYYAML_SETUP_TYPE = distutils
-PYTHON_PYYAML_LICENSE = Python software foundation license v2
+PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
 PYTHON_PYYAML_DEPENDENCIES = libyaml
 
