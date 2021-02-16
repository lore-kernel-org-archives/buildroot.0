From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 16 Feb 2021 21:16:43 +0100
Subject: [Buildroot] [git commit branch/next] support/scripts/cpedb.py:
 remove import pickle
Message-ID: <20210216195519.6BD5E83E23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c92d1c58cb2871f5475eee57a331fe86d0ba2954
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

pickle is no longer used since 09a71e6a75636

Fixes:
support/scripts/cpedb.py:7:1: F401 'pickle' imported but unused

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 74cfd3aeb7350a7be39f2d43b35273beba57f9c7)
---
 support/scripts/cpedb.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/scripts/cpedb.py b/support/scripts/cpedb.py
index b1e7e7012c..f4daf56124 100644
--- a/support/scripts/cpedb.py
+++ b/support/scripts/cpedb.py
@@ -4,7 +4,6 @@ import xml.etree.ElementTree as ET
 from xml.etree.ElementTree import Element, SubElement
 import gzip
 import os
-import pickle
 import requests
 import time
 from xml.dom import minidom
