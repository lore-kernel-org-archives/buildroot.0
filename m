From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 21:35:03 +0200
Subject: [Buildroot] [git commit] package/python-werkzeug: bump version to
 1.0.1
Message-ID: <20200930192534.A181B8756A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1494533a5c174c7e73d947ecd6143eb73fb07aee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index cc90fe140b..1d6de8a0c7 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5	5b23b4953efc4f52b1d0b33af6f7cd2d  Werkzeug-0.16.0.tar.gz
-sha256	7280924747b5733b246fe23972186c6b348f9ae29724135a6dfc1e53cea433e7  Werkzeug-0.16.0.tar.gz
+md5  5d499cfdd30de5d9c946994783772efd  Werkzeug-1.0.1.tar.gz
+sha256  6c80b1e5ad3665290ea39320b91e1be1e0d5f60652b964a3070216de83d2e47c  Werkzeug-1.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
+sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index fea25f8ee8..1013f8af80 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 0.16.0
+PYTHON_WERKZEUG_VERSION = 1.0.1
 PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/5e/fd/eb19e4f6a806cd6ee34900a687f181001c7a0059ff914752091aba84681f
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/27/a33329150147594eff0ea4c33c2036c0eadd933141055be0ff911f7f8d04
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
