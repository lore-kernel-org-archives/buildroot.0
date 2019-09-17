From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:51:28 +0200
Subject: [Buildroot] [git commit] DEVELOPERS: trim runtime tests for Ricardo
 Martincoski
Message-ID: <20190917204644.78E138EA87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10acb4ff6d2eccdb9db08fd289d0ecb3572f2b37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Keep listing the test infra so the developer is included in reviews, but
trim the list of tests to those the developer are most interested in.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 922a13a33f..8193d0b620 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1945,7 +1945,14 @@ N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
 F:	package/atop/
 
 N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
-F:	support/testing/
+F:	support/testing/infra/
+F:	support/testing/run-tests
+F:	support/testing/tests/core/test_file_capabilities.py
+F:	support/testing/tests/download/
+F:	support/testing/tests/package/*_python*.py
+F:	support/testing/tests/package/test_atop.py
+F:	support/testing/tests/package/test_syslog_ng.py
+F:	support/testing/tests/utils/test_check_package.py
 F:	utils/check-package
 F:	utils/checkpackagelib/
 
