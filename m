From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Jan 2020 21:55:22 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: add missing python-avro
 test
Message-ID: <20200102204730.BE3798EB6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=198bdaadd03f75fe959c21089c354d36c90069bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9fa2add810c (support/testing: add test for python-avro) added a
test for python-avro but failed to update .gitlab-ci.yml. Do that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3fbe2974d2..b953e1998c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -438,6 +438,7 @@ tests.package.test_python_autobahn.TestPythonPy2Autobahn: { extends: .runtime_te
 tests.package.test_python_autobahn.TestPythonPy3Autobahn: { extends: .runtime_test }
 tests.package.test_python_automat.TestPythonPy2Automat: { extends: .runtime_test }
 tests.package.test_python_automat.TestPythonPy3Automat: { extends: .runtime_test }
+tests.package.test_python_avro.TestPythonAvro: { extends: .runtime_test }
 tests.package.test_python_bitstring.TestPythonPy2Bitstring: { extends: .runtime_test }
 tests.package.test_python_bitstring.TestPythonPy3Bitstring: { extends: .runtime_test }
 tests.package.test_python_cbor.TestPythonPy2Cbor: { extends: .runtime_test }
