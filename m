From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:54:29 +0100
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_python_gobject.py: fix flake8 warning
Message-ID: <20200324144153.8E3697FE21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1214109cdc82ab1efe57bf958de487ffe924f43e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

   support/testing/tests/package/test_python_gobject.py:4:1: E302 expected 2 blank lines, found 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_python_gobject.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/testing/tests/package/test_python_gobject.py b/support/testing/tests/package/test_python_gobject.py
index be33882455..cd8a43252b 100644
--- a/support/testing/tests/package/test_python_gobject.py
+++ b/support/testing/tests/package/test_python_gobject.py
@@ -1,6 +1,7 @@
 import os
 from tests.package.test_python import TestPythonPackageBase
 
+
 class TestPythonPy3Gobject(TestPythonPackageBase):
     __test__ = True
     config = \
