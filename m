From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:40:11 +0100
Subject: [Buildroot] [PATCH v2 18/20] python-pyasn: allow to build with
	Python 3
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pyasn/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasn/Config.in b/package/python-pyasn/Config.in
index 13095f9..eca53db 100644
--- a/package/python-pyasn/Config.in
+++ b/package/python-pyasn/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYASN
 	bool "python-pyasn"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  PyASN is a Python extension module that enables you to
-- 
1.8.3.2
