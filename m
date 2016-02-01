From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon,  1 Feb 2016 15:05:20 +0100
Subject: [Buildroot] [PATCH 01/22] package/python-jinja2: bump version to
	2.8 (needed by python-crossbar).
In-Reply-To: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
Message-ID: <1454335541-14224-2-git-send-email-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
---
 package/python-jinja2/python-jinja2.hash | 7 ++++---
 package/python-jinja2/python-jinja2.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 6e8c160..b76d5b3 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,3 +1,4 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b9dffd2f3b43d673802fe857c8445b1a, sha256 locally computed
-md5	b9dffd2f3b43d673802fe857c8445b1a  Jinja2-2.7.3.tar.gz
-sha256	2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb  Jinja2-2.7.3.tar.gz
+# added by MCon: md5 is from site, sha is locally computed.
+md5	edb51693fe22c53cee5403775c71a99e  Jinja2-2.8.tar.gz
+sha1	4a33c1a0fd585eba2507e8c274a9cd113b1d13ab  Jinja2-2.8.tar.gz
+sha256	bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4  Jinja2-2.8.tar.gz
diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
index 8440b64..ce6e2b9 100644
--- a/package/python-jinja2/python-jinja2.mk
+++ b/package/python-jinja2/python-jinja2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_JINJA2_VERSION = 2.7.3
+PYTHON_JINJA2_VERSION = 2.8
 PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
 PYTHON_JINJA2_SITE = http://pypi.python.org/packages/source/J/Jinja2
 PYTHON_JINJA2_SETUP_TYPE = setuptools
-- 
2.1.4
