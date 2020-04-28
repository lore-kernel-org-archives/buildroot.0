From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Apr 2020 21:10:05 +0200
Subject: [Buildroot] [git commit] package/python-wtforms: bump to version
 2.3.1
Message-ID: <20200428185555.61D2590A3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9bb6e4600fb4931e614ef2a466fa6b00e971022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-wtforms/Config.in           | 1 +
 package/python-wtforms/python-wtforms.hash | 7 ++++---
 package/python-wtforms/python-wtforms.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-wtforms/Config.in b/package/python-wtforms/Config.in
index 96ed96da0a..33a17d3d37 100644
--- a/package/python-wtforms/Config.in
+++ b/package/python-wtforms/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WTFORMS
 	bool "python-wtforms"
+	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	help
 	  A flexible forms validation and rendering library for
 	  Python web development.
diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index 34beb08010..431a20cea1 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5	41c0008dbe7bd98892c58f7457a46a4a  WTForms-2.2.1.tar.gz
-sha256	0cdbac3e7f6878086c334aa25dc5a33869a3954e9d1e015130d65a69309b3b61  WTForms-2.2.1.tar.gz
+md5  bff06943e59671581af07f80d14bda5f  WTForms-2.3.1.tar.gz
+sha256  861a13b3ae521d6700dac3b2771970bd354a63ba7043ecc3a82b5288596a1972  WTForms-2.3.1.tar.gz
 # Locally computed sha256 checksums
-sha256	64cba207423f4478e3262c2e54209f8cd2057d687e200a50e0203db5659947a5  LICENSE.rst
+sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
+sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 2715320d27..c47bd0b748 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 2.2.1
+PYTHON_WTFORMS_VERSION = 2.3.1
 PYTHON_WTFORMS_SOURCE = WTForms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/cd/1d/7221354ebfc32b868740d02e44225c2ce00769b0d3dc370e463e2bc4b446
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/68/7a/4ce1636e03a25585f3e1436179232a66c25e53ef17f01b4384d16ace6d61
 PYTHON_WTFORMS_SETUP_TYPE = setuptools
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst
