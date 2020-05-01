From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  1 May 2020 15:20:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-jedi: bump to version 0.17.0
Message-ID: <20200501132033.2478334-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-jedi/python-jedi.hash | 4 ++--
 package/python-jedi/python-jedi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/python-jedi.hash b/package/python-jedi/python-jedi.hash
index 77af6e79f3..5d6fdf1f21 100644
--- a/package/python-jedi/python-jedi.hash
+++ b/package/python-jedi/python-jedi.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jedi/json
-md5  ba88266caac41988ffb4fd6041a3c354  jedi-0.15.1.tar.gz
-sha256  ba859c74fa3c966a22f2aeebe1b74ee27e2a462f56d3f5f7ca4a59af61bfe42e  jedi-0.15.1.tar.gz
+md5  d6a8e5832939c51dceda474b720696f6  jedi-0.17.0.tar.gz
+sha256  df40c97641cb943661d2db4c33c2e1ff75d491189423249e989bcea4464f3030  jedi-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  78e60cd0b8f28694f30195482c33d76908d846b0d15278deb7332aa22ba8e412  LICENSE.txt
 sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
diff --git a/package/python-jedi/python-jedi.mk b/package/python-jedi/python-jedi.mk
index 4e756a709c..719f3de03e 100644
--- a/package/python-jedi/python-jedi.mk
+++ b/package/python-jedi/python-jedi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JEDI_VERSION = 0.15.1
+PYTHON_JEDI_VERSION = 0.17.0
 PYTHON_JEDI_SOURCE = jedi-$(PYTHON_JEDI_VERSION).tar.gz
-PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/85/03/cd5a6e44a5753b4d539288d9d1f9645caac889c17dd2950292a8818f86b2
+PYTHON_JEDI_SITE = https://files.pythonhosted.org/packages/e3/5b/65ff9c102d92bf719dfaeff57bc8074d68f26ea480005704a956da995799
 PYTHON_JEDI_SETUP_TYPE = setuptools
 PYTHON_JEDI_LICENSE = MIT, BSD-3-Clause (flask theme), Apache-2.0 (typeshed)
 PYTHON_JEDI_LICENSE_FILES = \
-- 
2.26.2
