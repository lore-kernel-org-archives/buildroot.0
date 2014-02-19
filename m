From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 09:00:42 +0100
Subject: [Buildroot] [git commit branch/next] python-bottle: allow to build
	with Python 3
Message-ID: <20140219080355.DE1C399B3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=95e471c4d0376efef0f4667a4876d618679d0d5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-bottle/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
