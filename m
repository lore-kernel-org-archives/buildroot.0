From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 14:18:51 +0100
Subject: [Buildroot] [git commit] python-six: bump version to 1.11.0
Message-ID: <20171102131141.4257181025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=364920596a03a51d3b59a16acca4ef3bee0c526a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add licence file checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-six/python-six.hash | 6 ++++--
 package/python-six/python-six.mk   | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-six/python-six.hash b/package/python-six/python-six.hash
index a90c79b..f9dbf09 100644
--- a/package/python-six/python-six.hash
+++ b/package/python-six/python-six.hash
@@ -1,2 +1,4 @@
-# Locally computed:
-sha256  105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a  six-1.10.0.tar.gz
+# md5 from https://pypi.python.org/pypi/six/json, sha256 locally computed
+md5	d12789f9baf7e9fb2524c0c64f1773f8  six-1.11.0.tar.gz
+sha256	70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9  six-1.11.0.tar.gz
+sha256  63478682e84e8c98f4c46308995f1f521a6886976e25421827d2a2be03581328  LICENSE
diff --git a/package/python-six/python-six.mk b/package/python-six/python-six.mk
index 850f934..cd80634 100644
--- a/package/python-six/python-six.mk
+++ b/package/python-six/python-six.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIX_VERSION = 1.10.0
+PYTHON_SIX_VERSION = 1.11.0
 PYTHON_SIX_SOURCE = six-$(PYTHON_SIX_VERSION).tar.gz
-PYTHON_SIX_SITE = https://pypi.python.org/packages/source/s/six
+PYTHON_SIX_SITE = https://pypi.python.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe
 PYTHON_SIX_SETUP_TYPE = setuptools
 PYTHON_SIX_LICENSE = MIT
 PYTHON_SIX_LICENSE_FILES = LICENSE
