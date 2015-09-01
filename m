From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Date: Tue,  1 Sep 2015 10:10:28 +0200
Subject: [Buildroot] [PATCH 2/6] python-pyparsing: bump version
In-Reply-To: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
References: <1441095032-5656-1-git-send-email-cvubrugier@fastmail.fm>
Message-ID: <1441095032-5656-2-git-send-email-cvubrugier@fastmail.fm>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also download tarball from PyPI instead of SourceForge.

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/python-pyparsing/python-pyparsing.hash | 5 +++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index aee93af..df39116 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  17e43d6b17588ed5968735575b3983a952133ec4082596d214d7090b56d48a06  pyparsing-2.0.2.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0fe479be09fc2cf005f753d3acc35939, sha256 locally computed
+md5	0fe479be09fc2cf005f753d3acc35939  pyparsing-2.0.3.tar.gz
+sha256  06e729e1cbf5274703b1f47b6135ed8335999d547f9d8cf048b210fb8ebf844f  pyparsing-2.0.3.tar.gz
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 8e83f34..ad066b8 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 2.0.2
+PYTHON_PYPARSING_VERSION = 2.0.3
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-$(PYTHON_PYPARSING_VERSION)
+PYTHON_PYPARSING_SITE = https://pypi.python.org/packages/source/p/pyparsing
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = distutils
-- 
2.5.0
