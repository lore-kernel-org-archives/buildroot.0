From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 May 2017 17:15:10 +0200
Subject: [Buildroot] [git commit branch/next] python-pytablewriter: bump
	version to 0.19.5
Message-ID: <20170509152255.7A87E8285B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07f8f378a1ead35ae97ce8c58eb93d509078fe0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 80a9a02..eefcb3a 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5 c63d4d14836ae291e11448219abdf348  pytablewriter-0.17.2.tar.gz
-sha256 629ecb7bfe3fb033427e02e0291270d13ff14bfc4caf2cac66b797ac5aea5fd1  pytablewriter-0.17.2.tar.gz
+md5 fb404abd5a6aab2d8da8c93f24c9c974  pytablewriter-0.19.5.tar.gz
+sha256 0f06a73fc13fea7d6004ec9d96f2aeef920defaee1704268558a45e97455d35a  pytablewriter-0.19.5.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index 2788c85..50e85c2 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.17.2
+PYTHON_PYTABLEWRITER_VERSION = 0.19.5
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/47/5c/cbfed107164e56a6739d52694c4c584635970d6621b7e531464e89534956
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/db/c6/517cb51aee3c83b7eb60353f818aab0f39d310c925ea103cc54c0e0f8cd2
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
