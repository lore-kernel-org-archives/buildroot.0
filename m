From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 5 Aug 2019 22:22:01 +0200
Subject: [Buildroot] [git commit] utils/getdeveloperlib.py: fix flake8
 warnings
Message-ID: <20190805201914.4B8EB8D501@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0a066a8ff2c0f899be005b439fbadb1ab6d6a1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix a weird blank-line missing and 2 trailing blank-space.

Signed-off-by: Victor Huesca <victor.huesca@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
