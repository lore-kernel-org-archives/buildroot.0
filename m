From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:31:05 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: update with recently added
 tests
Message-ID: <20181206212823.1978586DB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=deff6a8fee9722d440e4f4ed86b8cb6eaa2631bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 412ef49b75..67f5da6839 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -317,7 +317,11 @@ tests.package.test_ipython.TestIPythonPy2: *runtime_test
 tests.package.test_ipython.TestIPythonPy3: *runtime_test
 tests.package.test_perl.TestPerl: *runtime_test
 tests.package.test_perl_class_load.TestPerlClassLoad: *runtime_test
+tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: *runtime_test
+tests.package.test_perl_encode_detect.TestPerlEncodeDetect: *runtime_test
 tests.package.test_perl_gdgraph.TestPerlGDGraph: *runtime_test
+tests.package.test_perl_io_socket_multicast.TestPerlIOSocketMulticast: *runtime_test
+tests.package.test_perl_io_socket_ssl.TestPerlIOSocketSSL: *runtime_test
 tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
 tests.package.test_perl_mail_dkim.TestPerlMailDKIM: *runtime_test
 tests.package.test_perl_x10.TestPerlX10: *runtime_test
