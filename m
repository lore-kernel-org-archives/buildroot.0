From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Mar 2020 15:54:29 +0100
Subject: [Buildroot] [git commit]
 support/testing/tests/package/test_gst1_python.py: fix flake8 warning
Message-ID: <20200324144153.8277C7FE21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a180c34b76312e262dcfce211f36b7a54bb9cec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  support/testing/tests/package/test_gst1_python.py:29:1: W391 blank line at end of file

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_gst1_python.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_gst1_python.py b/support/testing/tests/package/test_gst1_python.py
index 8d6efcbe4a..469e0f392d 100644
--- a/support/testing/tests/package/test_gst1_python.py
+++ b/support/testing/tests/package/test_gst1_python.py
@@ -26,4 +26,3 @@ class TestGst1Python(TestPythonPackageBase):
                            options=["-initrd", cpio_file])
         self.emulator.login()
     sample_scripts = ["tests/package/sample_gst1_python.py"]
-
