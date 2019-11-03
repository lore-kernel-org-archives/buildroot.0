From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Nov 2019 11:42:06 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] DEVELOPERS: drop entry
 for test_check_package.py
Message-ID: <20191103103708.67CCC8E5C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07d974df5298bbef0c5af690550266409f71acaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Commit 2ba99ff4e219b3d8 (DEVELOPERS: trim runtime tests for Ricardo
Martincoski) backported a commit to tweak the DEVELOPERS entry, but
test_check_package.py is not in 2019.02.x, leading to check-package
complaining:

WARNING: 'support/testing/tests/utils/test_check_package.py' doesn't match any file

So drop that line.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 55dbb2e0cf..ae2df884ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1790,7 +1790,6 @@ F:	support/testing/tests/download/
 F:	support/testing/tests/package/*_python*.py
 F:	support/testing/tests/package/test_atop.py
 F:	support/testing/tests/package/test_syslog_ng.py
-F:	support/testing/tests/utils/test_check_package.py
 F:	utils/check-package
 F:	utils/checkpackagelib/
 
