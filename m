From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 12:20:14 +0000
Subject: [Buildroot] [PATCH] python-pathvalidate: bump version to 0.14.1
Message-ID: <20170313122014.46876-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 68e6907..285d9f2 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pathvalidate/json, sha256 locally computed
-md5	03f0af69596f7de52d52753c2a585fce  pathvalidate-0.13.0.tar.gz
-sha256	1ecaebfbd32794abe5f47a20189d5f7dd196a6ba445c1a07429de6ce608bf9b9  pathvalidate-0.13.0.tar.gz
+md5 0bc59180ba894acabae6acd0989b386a  pathvalidate-0.14.1.tar.gz
+sha256 a8bfeaf05aa13e6c72fe323a11934cd9d1351bfc5452b05185c8871c76a33f93  pathvalidate-0.14.1.tar.gz
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index a8ab4ad..e128afe 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.13.0
+PYTHON_PATHVALIDATE_VERSION = 0.14.1
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/3a/03/ca01cdbf0f7b766b414d134e71b2eb689619dba0ddee002d53c2d58f6436
+PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/85/64/1a92053017f60401ddd7f54ae41670b829cde1f606bd563c3a340ee3f58a
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.10.2
