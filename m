From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:11:44 +0100
Subject: [Buildroot] [git commit] python-pathvalidate: bump version to 0.15.0
Message-ID: <20170321221152.6C69E825DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61c119bf1b465f1f684135b830038c0ac155d444
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 285d9f2..30e36d2 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pathvalidate/json, sha256 locally computed
-md5 0bc59180ba894acabae6acd0989b386a  pathvalidate-0.14.1.tar.gz
-sha256 a8bfeaf05aa13e6c72fe323a11934cd9d1351bfc5452b05185c8871c76a33f93  pathvalidate-0.14.1.tar.gz
+md5 869d111f587836920f5ae36751d422fc  pathvalidate-0.15.0.tar.gz
+sha256 5d0bb777b4a6b95426d4a4ac47dcf6a2c8173a78b4019e94b8e8a0d59b0095ed  pathvalidate-0.15.0.tar.gz
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index e128afe..36ab6a4 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.14.1
+PYTHON_PATHVALIDATE_VERSION = 0.15.0
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/85/64/1a92053017f60401ddd7f54ae41670b829cde1f606bd563c3a340ee3f58a
+PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/a6/7b/2c3026ead121829ed27eba4fba7b4cd6ec8c210f76b0601119a915918f6c
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
