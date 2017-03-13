From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 13 Mar 2017 12:20:52 +0000
Subject: [Buildroot] [PATCH] python-pytablewriter: bump version to 0.17.2
Message-ID: <20170313122052.47184-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/python-pytablewriter/python-pytablewriter.hash | 4 ++--
 package/python-pytablewriter/python-pytablewriter.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytablewriter/python-pytablewriter.hash b/package/python-pytablewriter/python-pytablewriter.hash
index 3b5bef3..80a9a02 100644
--- a/package/python-pytablewriter/python-pytablewriter.hash
+++ b/package/python-pytablewriter/python-pytablewriter.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pytablewriter/json, sha256 locally computed
-md5	7b909647bb8a87373f2553a6fccdf419  pytablewriter-0.17.1.tar.gz
-sha256	20c58c41359941262bf288d2fe81ca506e2a38cfdd337d982dbcb2e26ec4a3ed  pytablewriter-0.17.1.tar.gz
+md5 c63d4d14836ae291e11448219abdf348  pytablewriter-0.17.2.tar.gz
+sha256 629ecb7bfe3fb033427e02e0291270d13ff14bfc4caf2cac66b797ac5aea5fd1  pytablewriter-0.17.2.tar.gz
diff --git a/package/python-pytablewriter/python-pytablewriter.mk b/package/python-pytablewriter/python-pytablewriter.mk
index 6d2e545..2788c85 100644
--- a/package/python-pytablewriter/python-pytablewriter.mk
+++ b/package/python-pytablewriter/python-pytablewriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEWRITER_VERSION = 0.17.1
+PYTHON_PYTABLEWRITER_VERSION = 0.17.2
 PYTHON_PYTABLEWRITER_SOURCE = pytablewriter-$(PYTHON_PYTABLEWRITER_VERSION).tar.gz
-PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/a2/2f/093dded4e265705c1d87d68a9062acb69b39c6ec615f74d71c62f6625afa
+PYTHON_PYTABLEWRITER_SITE = https://pypi.python.org/packages/47/5c/cbfed107164e56a6739d52694c4c584635970d6621b7e531464e89534956
 PYTHON_PYTABLEWRITER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEWRITER_LICENSE = MIT
 PYTHON_PYTABLEWRITER_LICENSE_FILES = LICENSE
-- 
2.10.2
