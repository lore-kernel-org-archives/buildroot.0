From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:03:36 +0200
Subject: [Buildroot] [git commit branch/2020.08.x]
 support/scripts/pycompile: sort imports
Message-ID: <20200915185503.94EE0868C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a3aa4c772b5e511741366ce06df4c7911f2723c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Signed-off-by: Robin Jarry <robin.jarry@6wind.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4c77dca5503a40148ffbc177e5edd4cc6d093a0d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pycompile.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/support/scripts/pycompile.py b/support/scripts/pycompile.py
index fb1a12b2b7..b713fe1932 100644
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
