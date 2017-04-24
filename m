From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 11:50:04 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] python-pyyaml: correct
	license name
Message-ID: <20170424193336.AF1AB827E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=761533084bce35751335eeecab16c6e44104b804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

LICENSE file contains MIT license text and README file clearly mentions
pyyaml is released under MIT license.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 27fdc59e467e55bff1d5910c64e5381ca2814f5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
