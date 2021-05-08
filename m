From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 May 2021 16:34:00 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-asgiref:
 bump version to 3.3.4
Message-ID: <20210508142103.6ABF1861E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c5e17f41b3ee4907995cb13c7548bb95162593a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Needed by django 3.2.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8cccb01bbdc6d4ba99f131ea41576eae0fb710bd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-asgiref/python-asgiref.hash | 4 ++--
 package/python-asgiref/python-asgiref.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-asgiref/python-asgiref.hash b/package/python-asgiref/python-asgiref.hash
index 782a13fe5c..c349ad5a44 100644
--- a/package/python-asgiref/python-asgiref.hash
+++ b/package/python-asgiref/python-asgiref.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asgiref/json
-md5	39218c10eee0bf66a3d893491d835e86  asgiref-3.2.3.tar.gz
-sha256	7e06d934a7718bf3975acbf87780ba678957b87c7adc056f13b6215d610695a0  asgiref-3.2.3.tar.gz
+md5	5afe03ecc39ae94950ff95e80166d945  asgiref-3.3.4.tar.gz
+sha256	d1216dfbdfb63826470995d31caed36225dcaf34f182e0fa257a4dd9e86f1b78  asgiref-3.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-asgiref/python-asgiref.mk b/package/python-asgiref/python-asgiref.mk
index b29903509e..0353f5d5a0 100644
--- a/package/python-asgiref/python-asgiref.mk
+++ b/package/python-asgiref/python-asgiref.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASGIREF_VERSION = 3.2.3
+PYTHON_ASGIREF_VERSION = 3.3.4
 PYTHON_ASGIREF_SOURCE = asgiref-$(PYTHON_ASGIREF_VERSION).tar.gz
-PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/80/c4/83a01607f2d10024c172097126264c8e00c6a4827b35d631ece9625e6ba2
+PYTHON_ASGIREF_SITE = https://files.pythonhosted.org/packages/d8/3f/ef696a6d8254f182b1a089aeffb638d2eb83055e603146d3a40605c5b7da
 PYTHON_ASGIREF_SETUP_TYPE = setuptools
 PYTHON_ASGIREF_LICENSE = BSD-3-Clause
 PYTHON_ASGIREF_LICENSE_FILES = LICENSE
