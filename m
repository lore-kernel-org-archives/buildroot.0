From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 17:00:47 +0200
Subject: [Buildroot] [git commit] package/python-requests-toolbeit: bump to
 version 0.9.1
Message-ID: <20191005150350.7C14B80E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8109549ba7ed4b73d29ac316a374bfda043dfe50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-requests-toolbelt/python-requests-toolbelt.hash | 8 +++++---
 package/python-requests-toolbelt/python-requests-toolbelt.mk   | 4 ++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.hash b/package/python-requests-toolbelt/python-requests-toolbelt.hash
index 75343b052f..1b733fd7eb 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.hash
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/requests_toolbelt/json, sha256 locally computed
-md5 be245e2093a9610fb2eb399afc063ad2 requests-toolbelt-0.7.1.tar.gz
-sha256 c3843884269d79e492522f3e9f490917e074c1ddbb80111968970e721fe36eaf requests-toolbelt-0.7.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/requests-toolbelt/json
+md5	b1509735c4b4cf95df2619facbc3672e  requests-toolbelt-0.9.1.tar.gz
+sha256	968089d4584ad4ad7c171454f0a5c6dac23971e9472521ea3b6d49d610aa6fc0  requests-toolbelt-0.9.1.tar.gz
+# Locally computed sha256 checksums
+sha256	3a1a3cffa7abc000cbd726a664f56c33c532a55480f9e056dfe941cf93b7c37f  LICENSE
diff --git a/package/python-requests-toolbelt/python-requests-toolbelt.mk b/package/python-requests-toolbelt/python-requests-toolbelt.mk
index ce1d95871a..119c402785 100644
--- a/package/python-requests-toolbelt/python-requests-toolbelt.mk
+++ b/package/python-requests-toolbelt/python-requests-toolbelt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_TOOLBELT_VERSION = 0.7.1
+PYTHON_REQUESTS_TOOLBELT_VERSION = 0.9.1
 PYTHON_REQUESTS_TOOLBELT_SOURCE = requests-toolbelt-$(PYTHON_REQUESTS_TOOLBELT_VERSION).tar.gz
-PYTHON_REQUESTS_TOOLBELT_SITE = https://pypi.python.org/packages/ab/bf/2af6b25f880e2d529a524f98837d33b1048a2a15703fc4806185b54e9672
+PYTHON_REQUESTS_TOOLBELT_SITE = https://files.pythonhosted.org/packages/28/30/7bf7e5071081f761766d46820e52f4b16c8a08fef02d2eb4682ca7534310
 PYTHON_REQUESTS_TOOLBELT_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_TOOLBELT_LICENSE = Apache-2.0
 PYTHON_REQUESTS_TOOLBELT_LICENSE_FILES = LICENSE
