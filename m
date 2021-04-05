From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  5 Apr 2021 21:52:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-toml: bump to version 0.10.2
Message-ID: <20210405195257.705192-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update hash of LICENSE (update in year and author added:
  https://github.com/uiri/toml/commit/a86fc1fbd650a19eba313c3f642c9e2c679dc8d6)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-toml/python-toml.hash | 6 +++---
 package/python-toml/python-toml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-toml/python-toml.hash b/package/python-toml/python-toml.hash
index f0641ccda8..dd7215e861 100644
--- a/package/python-toml/python-toml.hash
+++ b/package/python-toml/python-toml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/toml/json
-md5	63fffbe2d632865ec29cd69bfdf36682  toml-0.10.0.tar.gz
-sha256	229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c  toml-0.10.0.tar.gz
+md5  59bce5d8d67e858735ec3f399ec90253  toml-0.10.2.tar.gz
+sha256  b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f  toml-0.10.2.tar.gz
 # Locally computed sha256 checksums
-sha256	a879cc43c06aca11ada36f71c8db7257449ff4451874a0903f129920c66fcf2d  LICENSE
+sha256  2d9294823df6c89357c8be4927fce79361d6561e5ee7532d5926e63939aaa536  LICENSE
diff --git a/package/python-toml/python-toml.mk b/package/python-toml/python-toml.mk
index 8a61be2f4f..0e95652165 100644
--- a/package/python-toml/python-toml.mk
+++ b/package/python-toml/python-toml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOML_VERSION = 0.10.0
+PYTHON_TOML_VERSION = 0.10.2
 PYTHON_TOML_SOURCE = toml-$(PYTHON_TOML_VERSION).tar.gz
-PYTHON_TOML_SITE = https://files.pythonhosted.org/packages/b9/19/5cbd78eac8b1783671c40e34bb0fa83133a06d340a38b55c645076d40094
+PYTHON_TOML_SITE = https://files.pythonhosted.org/packages/be/ba/1f744cdc819428fc6b5084ec34d9b30660f6f9daaf70eead706e3203ec3c
 PYTHON_TOML_SETUP_TYPE = setuptools
 PYTHON_TOML_LICENSE = MIT
 PYTHON_TOML_LICENSE_FILES = LICENSE
-- 
2.30.2
