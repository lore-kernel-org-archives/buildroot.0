From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Nov 2018 22:41:53 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: update after addition of
 TestF2FS test case
Message-ID: <20181108213927.0F28B81E38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e5a204dd8414673def51f3cf1f772357c9539b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a5fbdcb0d8..c78f2ea581 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -287,6 +287,7 @@ tests.fs.test_ext.TestExt2: *runtime_test
 tests.fs.test_ext.TestExt2r1: *runtime_test
 tests.fs.test_ext.TestExt3: *runtime_test
 tests.fs.test_ext.TestExt4: *runtime_test
+tests.fs.test_f2fs.TestF2FS: *runtime_test
 tests.fs.test_iso9660.TestIso9660Grub2External: *runtime_test
 tests.fs.test_iso9660.TestIso9660Grub2ExternalCompress: *runtime_test
 tests.fs.test_iso9660.TestIso9660Grub2Internal: *runtime_test
