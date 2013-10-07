From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Mon, 7 Oct 2013 11:57:21 -0500
Subject: [Buildroot] [PATCH 2/2] python-pyparsing: rename package's
	Config.in bool
In-Reply-To: <1381165041-9024-1-git-send-email-rjbarnet@rockwellcollins.com>
References: <1381165041-9024-1-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <1381165041-9024-2-git-send-email-rjbarnet@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove unnecessary tab/spaces on blank line.

Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>

--
Trivial Fix:
This makes the naming of the package in the menuconfig consistent with
the naming of the package's directory and make rules.
---
 package/python-pyparsing/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
index 126dd0e..49a474b 100644
--- a/package/python-pyparsing/Config.in
+++ b/package/python-pyparsing/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_PYTHON_PYPARSING
-	bool "pyparsing"
+	bool "python-pyparsing"
 	depends on BR2_PACKAGE_PYTHON
 	help
 	  The pyparsing module is an alternative approach to creating and
@@ -7,5 +7,5 @@ config BR2_PACKAGE_PYTHON_PYPARSING
 	  or the use of regular expressions. The pyparsing module provides
 	  a library of classes that client code uses to construct the grammar
 	  directly in Python code.
-	  
+
 	  http://pyparsing.wikispaces.com/
-- 
1.7.1
