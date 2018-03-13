From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:32:01 +0100
Subject: [Buildroot] [git commit] scanpypi: fix code style
Message-ID: <20180313213834.9836681428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ede92be10dc1260765a83ed2e7f83f9315adce39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix these warnings:
E401 multiple imports on one line

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index b9006ee4f7..505ba0a246 100755
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
