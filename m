From: =?UTF-8?q?Andr=C3=A9=20Erdmann?= <dywi@mailerd.de>
Date: Wed, 18 Mar 2015 16:50:34 +0100
Subject: [Buildroot] [PATCH v2 01/10] autobuild-run: fixup imports
In-Reply-To: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
Message-ID: <1426693843-28792-2-git-send-email-dywi@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* drop "import ConfigParser", module gets imported as "configparser"
  See commit 16fcf29310bbb2533a98eb2247fc1415cb27e514

* drop "import argparse", currently unused

Signed-off-by: Andr? Erdmann <dywi@mailerd.de>
---
 scripts/autobuild-run | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 872ee9d..01f0957 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -121,8 +121,6 @@ import shutil
 from time import localtime, strftime
 import sys
 import hashlib
-import argparse
-import ConfigParser
 import docopt
 
 if sys.hexversion >= 0x3000000:
-- 
2.3.2
