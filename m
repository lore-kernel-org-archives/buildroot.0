From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 10:37:38 +0200
Subject: [Buildroot] [git commit branch/next] python-pytablewriter: bump
	version to 0.19.7
Message-ID: <20170517084754.D7C268029F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b23c9ae44f668a1cc9592113307502c6856721aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index eefcb3a..570a7ab 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5 fb404abd5a6aab2d8da8c93f24c9c974  pytablewriter-0.19.5.tar.gz
-sha256 0f06a73fc13fea7d6004ec9d96f2aeef920defaee1704268558a45e97455d35a  pytablewriter-0.19.5.tar.gz
+md5 0f559538d2d40b1f59904b3bf6c66b35  pytablewriter-0.19.7.tar.gz
+sha256 09c841a08cfcecc51e7ffc1846c5200b9f25ef6a3ed82a1a33f714b1c0d9ef94  pytablewriter-0.19.7.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index 50e85c2..24a4d2e 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.19.5
+PYTHON_PYTABLEWRITER_VERSION = 0.19.7
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/db/c6/517cb51aee3c83b7eb60353f818aab0f39d310c925ea103cc54c0e0f8cd2
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/2d/5d/02baae4e38413608a77abec5f4ad9a665ba788802e84d7f84cfd9fbe49a2
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
