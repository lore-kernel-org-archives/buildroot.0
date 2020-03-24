From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:28:21 +0100
Subject: [Buildroot] [git commit] support/testing/tests/init/init_openrc:
 fix flake8 F401 warning
Message-ID: <20200324144153.58E228805D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e025dd80bcffaa74971666ed9d1e38ef0f766ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

support/testing/tests/init/test_openrc.py:1:1: F401 'infra.basetest' imported but unused

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/init/test_openrc.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/init/test_openrc.py b/support/testing/tests/init/test_openrc.py
index 7db4c34119..14839434ef 100644
--- a/support/testing/tests/init/test_openrc.py
+++ b/support/testing/tests/init/test_openrc.py
@@ -1,4 +1,3 @@
-import infra.basetest
 from tests.init.base import InitSystemBase as InitSystemBase
 
 
