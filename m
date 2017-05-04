From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:19:02 +0200
Subject: [Buildroot] [git commit] package/python-ipython: Reformat help text
	to avoid warnings
Message-ID: <20170504201906.C71328285E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40edddc8ccfa0b51136260969367cfa00ffeee65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformat help text in Config.in to avoid warnings from
check-package. No content change intended.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ipython/Config.in | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index 1d92873..b87f2bc 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
 	help
-	  IPython is a command shell for interactive computing in multiple
-	  programming languages, originally developed for the Python
-	  programming language, that offers enhanced introspection, rich
-	  media, additional shell syntax, tab completion, and rich history.
+	  IPython is a command shell for interactive computing in
+	  multiple programming languages, originally developed for the
+	  Python programming language, that offers enhanced
+	  introspection, rich media, additional shell syntax, tab
+	  completion, and rich history.
 
 	  http://ipython.org/
