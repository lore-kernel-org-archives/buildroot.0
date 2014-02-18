From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:40:12 +0100
Subject: [Buildroot] [PATCH v2 19/20] python-pycrypto: allow to build with
	Python 3
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pycrypto/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pycrypto/Config.in b/package/python-pycrypto/Config.in
index 60a3446..fe545b5 100644
--- a/package/python-pycrypto/Config.in
+++ b/package/python-pycrypto/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYCRYPTO
 	bool "python-pycrypto"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_GMP
 	help
 	  PyCrypto is a collection of cryptographic algorithms and
-- 
1.8.3.2
