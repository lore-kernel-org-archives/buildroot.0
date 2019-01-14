From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Jan 2019 20:59:33 +0100
Subject: [Buildroot] [PATCH] package/python-setuptools: add comment about
 python3-setuptools
Message-ID: <20190114195934.20025-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Arnout, add a comment to indicate that the version of
python-setuptools must be kept in sync with python3-setuptools.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools/python-setuptools.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index d915449c5d..015347d49b 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# Please keep in sync with
+# package/python3-setuptools/python3-setuptools.mk
 PYTHON_SETUPTOOLS_VERSION = 40.6.3
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).zip
 PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/37/1b/b25507861991beeade31473868463dad0e58b1978c209de27384ae541b0b
-- 
2.20.1
