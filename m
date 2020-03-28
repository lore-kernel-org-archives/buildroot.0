From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 28 Mar 2020 09:21:08 +0100
Subject: [Buildroot] [git commit] gitlab-ci: regenerate to accomodate for a
 removed test
Message-ID: <20200328080925.E1C0288838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f8cd0c2a9a7323d7e34cc8c9d330ef4f44bd3751
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a570f63dd4b (Revert "package/perl-crypt-ssleay: new package")
forgot to deregister the associated test from the gitlab-ci list.

Remove it now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .gitlab-ci.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6f3e177882..72e2068ec2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -431,7 +431,6 @@ tests.package.test_openjdk.TestOpenJdk: { extends: .runtime_test }
 tests.package.test_opkg.TestOpkg: { extends: .runtime_test }
 tests.package.test_perl.TestPerl: { extends: .runtime_test }
 tests.package.test_perl_class_load.TestPerlClassLoad: { extends: .runtime_test }
-tests.package.test_perl_crypt_ssleay.TestPerlCryptSSLeay: { extends: .runtime_test }
 tests.package.test_perl_dbd_mysql.TestPerlDBDmysql: { extends: .runtime_test }
 tests.package.test_perl_encode_detect.TestPerlEncodeDetect: { extends: .runtime_test }
 tests.package.test_perl_gdgraph.TestPerlGDGraph: { extends: .runtime_test }
