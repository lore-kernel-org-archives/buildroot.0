From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 25 Feb 2015 22:17:25 +0100
Subject: [Buildroot] [PATCH 08/13] autobuild-run: sort imports alphabetically
In-Reply-To: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
References: <1424899050-24932-1-git-send-email-dywi@mailerd.de>
Message-ID: <1424899050-24932-9-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index e0971cb..52577e7 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -59,18 +59,18 @@
 
 from __future__ import print_function
 
+import argparse
 import contextlib
 import csv
-from random import randint
-import subprocess
+import hashlib
 from multiprocessing import Process
-import signal
 import os
+from random import randint
 import shutil
-from time import localtime, strftime
+import signal
+import subprocess
 import sys
-import hashlib
-import argparse
+from time import localtime, strftime
 
 if sys.hexversion >= 0x3000000:
     import configparser
-- 
2.3.0
