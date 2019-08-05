From: Victor Huesca <victor.huesca@bootlin.com>
Date: Mon,  5 Aug 2019 11:51:47 +0200
Subject: [Buildroot] [PATCH] utils/getdeveloperlib.py: fix flake8 complaints
Message-ID: <20190805095147.24244-1-victor.huesca@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix a weird blank-line missing and 2 trailing blank-space.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
---
 utils/getdeveloperlib.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index c18236b3a5..239ffa340b 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -79,9 +79,9 @@ def analyze_patches(patches):
     return (allfiles, allinfras)
 
 
-# 
+#
 # Unit-test parsing functions
-# 
+#
 
 def get_all_test_cases(suite):
     """Generate all test-cases from a given test-suite.
@@ -108,6 +108,7 @@ def list_unittests(path):
 
 unittests = {}
 
+
 #
 # DEVELOPERS file parsing functions
 #
-- 
2.21.0
