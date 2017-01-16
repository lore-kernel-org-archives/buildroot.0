From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:24:05 +0100
Subject: [Buildroot] [git commit] python-bottle: bump version to 0.12.13
Message-ID: <20170116124621.08C488179D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f386e50ee5f0d3d885b6948138b9a7fdc020308b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

0.12.12 and 0.12.13 are both bugfix releases, fixing issues introduced in
0.12.11:

https://github.com/bottlepy/bottle/issues/918
https://github.com/bottlepy/bottle/issues/923

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bottle/python-bottle.hash | 4 ++--
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 357391d..3006c16 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/bottle/json, sha256 locally computed
-md5	6c38912f4755ba71d852fbe320bdd61c  bottle-0.12.11.tar.gz
-sha256	a1958f9725042a9809ebe33d7eadf90d1d563a8bdd6ce5f01849bff7e941a731  bottle-0.12.11.tar.gz
+md5	d2fe1b48c1d49217e78bf326b1cad437  bottle-0.12.13.tar.gz
+sha256	39b751aee0b167be8dffb63ca81b735bbf1dd0905b3bc42761efedee8f123355  bottle-0.12.13.tar.gz
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 4757062..6f071f6 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.11
+PYTHON_BOTTLE_VERSION = 0.12.13
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://pypi.python.org/packages/a1/f6/0db23aeeb40c9a7c5d226b1f70ce63822c567178eee5b623bca3e0cc3bef
+PYTHON_BOTTLE_SITE = https://pypi.python.org/packages/bd/99/04dc59ced52a8261ee0f965a8968717a255ea84a36013e527944dbf3468c
 PYTHON_BOTTLE_LICENSE = MIT
 # README.rst refers to the file "LICENSE" but it's not included
 PYTHON_BOTTLE_SETUP_TYPE = setuptools
