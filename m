From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 27 Apr 2017 14:33:39 -0700
Subject: [Buildroot] [PATCH v2 09/10] package/python-ipython: Reformat help
	text to avoid warnings
In-Reply-To: <20170427213340.26917-1-andrew.smirnov@gmail.com>
References: <20170427213340.26917-1-andrew.smirnov@gmail.com>
Message-ID: <20170427213340.26917-10-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformat help text in Config.in to avoid warnings from
check-package. No content change intended.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
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
-- 
2.9.3
