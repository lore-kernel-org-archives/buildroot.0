From: Robin Jarry <robin.jarry@6wind.com>
Date: Tue,  8 Sep 2020 10:10:24 +0200
Subject: [Buildroot] [PATCH v2 2/4] pycompile: sort imports
In-Reply-To: <20200908081026.4701-1-robin.jarry@6wind.com>
References: <20200904112908.21686-1-julien.floret@6wind.com>
 <20200908081026.4701-1-robin.jarry@6wind.com>
Message-ID: <20200908081026.4701-3-robin.jarry@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sort imports alphabetically.

Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
---
 support/scripts/pycompile.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index fb1a12b2b782..b713fe19323c 100644
--- a/support/scripts/pycompile.py
+++ b/support/scripts/pycompile.py
@@ -6,11 +6,13 @@ when a python byte code generation failed.
 Inspired from:
    http://stackoverflow.com/questions/615632/how-to-detect-errors-from-compileall-compile-dir
 '''
+
 from __future__ import print_function
-import sys
-import py_compile
-import compileall
+
 import argparse
+import compileall
+import py_compile
+import sys
 
 
 def check_for_errors(comparison):
-- 
2.28.0
