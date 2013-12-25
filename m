From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Dec 2013 10:29:56 +0100
Subject: [Buildroot] [PATCH] python-bottle: add missing dependency on python
Message-ID: <ea8a4bf24136f5aa4d97.1387963796@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/python-bottle/Config.in |  1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/python-bottle/Config.in b/package/python-bottle/Config.in
--- a/package/python-bottle/Config.in
+++ b/package/python-bottle/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTTLE
 	bool "python-bottle"
+	depends on BR2_PACKAGE_PYTHON
 	help
 	  Bottle is a fast, simple and lightweight WSGI micro web-framework
 	  for Python. It is distributed as a single file module and has no
