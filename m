From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 5 Dec 2019 23:45:58 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: add missing python-gobject
 test
Message-ID: <20191205223830.DC6EF882A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a324180e610413d91d211c1adc8c8e617a37116
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 600132f8c08a5ae3d399559dd9c17d3b7b4c6ae3 added a test for
python-gobject but failed to update .gitlab-ci.yml. Do that now.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 75b2fcb37c..6deb97351b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -449,6 +449,7 @@ tests.package.test_python_crossbar.TestPythonPy3Crossbar: { extends: .runtime_te
 tests.package.test_python_cryptography.TestPythonPy2Cryptography: { extends: .runtime_test }
 tests.package.test_python_cryptography.TestPythonPy3Cryptography: { extends: .runtime_test }
 tests.package.test_python_django.TestPythonPy3Django: { extends: .runtime_test }
+tests.package.test_python_gobject.TestPythonPy2Gobject: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy2Incremental: { extends: .runtime_test }
 tests.package.test_python_incremental.TestPythonPy3Incremental: { extends: .runtime_test }
 tests.package.test_python_passlib.TestPythonPy2Passlib: { extends: .runtime_test }
