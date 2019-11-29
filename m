From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:32:03 +0100
Subject: [Buildroot] [git commit branch/next] package/python-multidict: bump
 to version 4.6.1
Message-ID: <20191129092811.AF3C381E74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1e378e2c5e89db7fd4c0977dfbf0300108f0d35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-multidict/python-multidict.hash | 4 ++--
 package/python-multidict/python-multidict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
index a98c4553d4..1e7b704626 100644
--- a/package/python-multidict/python-multidict.hash
+++ b/package/python-multidict/python-multidict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/multidict/json
-md5	5e9d8f7e1ada9a22932aed6a72f88e43  multidict-4.5.2.tar.gz
-sha256	024b8129695a952ebd93373e45b5d341dbb87c17ce49637b34000093f243dd4f  multidict-4.5.2.tar.gz
+md5	bee3828781685758410fa0fbcda8c88e  multidict-4.6.1.tar.gz
+sha256	5159c4975931a1a78bf6602bbebaa366747fce0a56cb2111f44789d2c45e379f  multidict-4.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256	a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
index 7b9cd39283..e3df5a64bf 100644
--- a/package/python-multidict/python-multidict.mk
+++ b/package/python-multidict/python-multidict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIDICT_VERSION = 4.5.2
+PYTHON_MULTIDICT_VERSION = 4.6.1
 PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
-PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/7f/8f/b3c8c5b062309e854ce5b726fc101195fbaa881d306ffa5c2ba19efa3af2
+PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/8a/74/61547af55c077b8d2e3648c2af74c08fa1e382665b290468db7ba54db2ea
 PYTHON_MULTIDICT_SETUP_TYPE = setuptools
 PYTHON_MULTIDICT_LICENSE = Apache-2.0
 PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
