From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 23:09:33 +0100
Subject: [Buildroot] [git commit] python-psutil: bump to 3.4.2
Message-ID: <20160205221225.7B3ED8175E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=597270689d34df12edb25ea9839b739631a1870f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-psutil/python-psutil.hash | 6 +++---
 package/python-psutil/python-psutil.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
index 7897b15..21de357 100644
--- a/package/python-psutil/python-psutil.hash
+++ b/package/python-psutil/python-psutil.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=015a013c46bb9bc30b5c344f26dea0d3, sha256 locally computed
-md5	015a013c46bb9bc30b5c344f26dea0d3  psutil-2.1.3.tar.gz
-sha256	b434c75f01715777391f10f456002e33d0ca14633f96fdbd9ff9139b42d9452c  psutil-2.1.3.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=53d18a5a2aff970d5658c22921c2bbe6, sha256 locally computed
+md5	53d18a5a2aff970d5658c22921c2bbe6  psutil-3.4.2.tar.gz
+sha256  b17fa01aa766daa388362d0eda5c215d77e03a8d37676b68971f37bf3913b725  psutil-3.4.2.tar.gz
diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 870984d..3570ff4 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PSUTIL_VERSION = 2.1.3
+PYTHON_PSUTIL_VERSION = 3.4.2
 PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
 PYTHON_PSUTIL_SITE = http://pypi.python.org/packages/source/p/psutil
 PYTHON_PSUTIL_SETUP_TYPE = setuptools
