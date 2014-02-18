From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:40:09 +0100
Subject: [Buildroot] [PATCH v2 16/20] python-bottle: allow to build with
	Python 3
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-17-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-bottle/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-bottle/Config.in b/package/python-bottle/Config.in
index 07f490c..7b13c1d 100644
--- a/package/python-bottle/Config.in
+++ b/package/python-bottle/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTTLE
 	bool "python-bottle"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  Bottle is a fast, simple and lightweight WSGI micro web-framework
 	  for Python. It is distributed as a single file module and has no
-- 
1.8.3.2
