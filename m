From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Feb 2016 09:14:40 +0100
Subject: [Buildroot] [git commit] python-jinja2: bump to 2.8
Message-ID: <20160202081511.1C6B081696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2e2eff303095366092e11278bc0689e707cf9ef5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-jinja2/python-jinja2.hash | 6 +++---
 package/python-jinja2/python-jinja2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
index 6e8c160..04fcbc8 100644
--- a/package/python-jinja2/python-jinja2.hash
+++ b/package/python-jinja2/python-jinja2.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=b9dffd2f3b43d673802fe857c8445b1a, sha256 locally computed
-md5	b9dffd2f3b43d673802fe857c8445b1a  Jinja2-2.7.3.tar.gz
-sha256	2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb  Jinja2-2.7.3.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=edb51693fe22c53cee5403775c71a99e, sha256 locally computed.
+md5	edb51693fe22c53cee5403775c71a99e  Jinja2-2.8.tar.gz
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
