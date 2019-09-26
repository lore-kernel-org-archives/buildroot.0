From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 11:23:49 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] DEVELOPERS: trim runtime
 tests for Ricardo Martincoski
Message-ID: <20190926091920.1CA5E8F808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d559b3d6e34c5da0e5395c2b2a4f9dfd72d1f20f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Keep listing the test infra so the developer is included in reviews, but
trim the list of tests to those the developer are most interested in.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 10acb4ff6d2eccdb9db08fd289d0ecb3572f2b37)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index af1b5cf16e..da9506e03a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1859,7 +1859,14 @@ N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
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
 
