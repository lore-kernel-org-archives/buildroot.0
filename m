From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2020 10:14:32 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-semver:
 bump version to 2.10.2
Message-ID: <20201002082529.5E7EA8152D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91348417e726d16beb1d3330430ebf26a8368af6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Bugfix release, fixing an issue with version fields containing '0'.  For
details, see the changelog:

https://python-semver.readthedocs.io/en/2.10.2/changelog.html#version-2-10-2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2be774303dc14be8f80eeac3f9a0a9cb10fb51e8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-semver/python-semver.hash | 4 ++--
 package/python-semver/python-semver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-semver/python-semver.hash b/package/python-semver/python-semver.hash
index 510b42cac9..5c13764e57 100644
--- a/package/python-semver/python-semver.hash
+++ b/package/python-semver/python-semver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/semver/json
-md5  a8466a3a0487a90e97a4199ad174d3e9  semver-2.10.1.tar.gz
-sha256  b08a84f604ef579e474ce448672a05c8d50d1ee0b24cee9fb58a12b260e4d0dc  semver-2.10.1.tar.gz
+md5  3e11ae9782121e8ffe9f8a8b763a8cb5  semver-2.10.2.tar.gz
+sha256  c0a4a9d1e45557297a722ee9bac3de2ec2ea79016b6ffcaca609b0bc62cf4276  semver-2.10.2.tar.gz
 # Locally computed
 sha256  cda490c32e61d3884dc17791fc8078f2a3e564fba98dd18b4dc64eb2720b2b6f  LICENSE.txt
diff --git a/package/python-semver/python-semver.mk b/package/python-semver/python-semver.mk
index fec02546ba..32ed6b971f 100644
--- a/package/python-semver/python-semver.mk
+++ b/package/python-semver/python-semver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEMVER_VERSION = 2.10.1
+PYTHON_SEMVER_VERSION = 2.10.2
 PYTHON_SEMVER_SOURCE = semver-$(PYTHON_SEMVER_VERSION).tar.gz
-PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/bc/82/5a9ee107810deb6cb142ea3b07aba619d6b6c0bd74c9e276b2b48b62696e
+PYTHON_SEMVER_SITE = https://files.pythonhosted.org/packages/aa/e8/cb894f70a52887f001aff5f264f68272c21fa58268495aca17df396c161f
 PYTHON_SEMVER_SETUP_TYPE = setuptools
 PYTHON_SEMVER_LICENSE = BSD-3-Clause
 PYTHON_SEMVER_LICENSE_FILES = LICENSE.txt
