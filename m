From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:14:27 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-semver:
 bump version to 2.10.1
Message-ID: <20201002082529.520758152D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e679087e814d34cc65dbfab6facea98594c7cc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

And adjust the .hash spacing.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 63a3b012bae967a3000e888b34b7a1a799cc058c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-semver/python-semver.hash | 6 +++---
 package/python-semver/python-semver.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 60aaa6b8c4..510b42cac9 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5	a411b305a3f6714bca126a0b59dc4429  semver-2.9.0.tar.gz
-sha256	ed1edeaa0c27f68feb74f09f715077fd07b728446dc2bb7fc470fc0f737873a0  semver-2.9.0.tar.gz
+md5  a8466a3a0487a90e97a4199ad174d3e9  semver-2.10.1.tar.gz
+sha256  b08a84f604ef579e474ce448672a05c8d50d1ee0b24cee9fb58a12b260e4d0dc  semver-2.10.1.tar.gz
 # Locally computed
-sha256	cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
+sha256  cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index 6e1faef126..fec02546ba 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 2.9.0
+PYTHON_SEMVER_VERSION = 2.10.1
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/be/c8/392e3c1c4080202b99e8b3b5d0ab6cbcfc4b25d50031c2c21d130871bf88
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/bc/82/5a9ee107810deb6cb142ea3b07aba619d6b6c0bd74c9e276b2b48b62696e
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
