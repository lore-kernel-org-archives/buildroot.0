From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Mar 2021 21:21:16 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/python{3}-pyyaml:
 switch to setuptools
Message-ID: <20210314201241.38C547F9E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a2f44dc91b0b63f3304faba4ebb1a513c8d2eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Since version 5.4.0 pyyaml uses setuptools (see
https://github.com/yaml/pyyaml/blob/master/CHANGES)

Fixes:
  - http://autobuild.buildroot.net/results/bc36ae51a1e4d70c5fd2a3eb4b458aba4220f2dc

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d64a905d9f8ec61eb4390f7b0317f070c6869ed5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyyaml/python-pyyaml.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 9f3fe3af40..9c98d9b87c 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -7,7 +7,7 @@
 PYTHON_PYYAML_VERSION = 5.4.1
 PYTHON_PYYAML_SOURCE = PyYAML-$(PYTHON_PYYAML_VERSION).tar.gz
 PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/a0/a4/d63f2d7597e1a4b55aa3b4d6c5b029991d3b824b5bd331af8d4ab1ed687d
-PYTHON_PYYAML_SETUP_TYPE = distutils
+PYTHON_PYYAML_SETUP_TYPE = setuptools
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
 PYTHON_PYYAML_DEPENDENCIES = libyaml
