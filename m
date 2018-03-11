From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 11 Mar 2018 02:15:31 -0300
Subject: [Buildroot] [PATCH v2 4/7] scanpypi: fix code style
In-Reply-To: <1520745334-13411-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1520745334-13411-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1520745334-13411-5-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E401 multiple imports on one line

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - new patch.
---
 utils/scanpypi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index b9006ee..505ba0a 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -10,7 +10,9 @@ from __future__ import print_function
 from __future__ import absolute_import
 import argparse
 import json
-import six.moves.urllib.request, six.moves.urllib.error, six.moves.urllib.parse
+import six.moves.urllib.request
+import six.moves.urllib.error
+import six.moves.urllib.parse
 import sys
 import os
 import shutil
-- 
2.7.4
