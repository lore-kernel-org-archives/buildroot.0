From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 13 Feb 2020 11:09:05 +0100
Subject: [Buildroot] [PATCH 1/2] support/run-tests: reorder imports
Message-ID: <20200213100906.11506-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Reorder imports using the isort utility.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 support/testing/run-tests | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 74741aee1b..77a13dc78c 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -1,9 +1,10 @@
 #!/usr/bin/env python3
 import argparse
-import sys
+import multiprocessing
 import os
+import sys
+
 import nose2
-import multiprocessing
 
 from infra.basetest import BRConfigTest
 
-- 
2.17.0
