From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 23:15:20 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: regenerate after prosody
 tests addition
Message-ID: <20181206221156.868CD83CFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=acb89c8d93952468fc9e24c7ddd9e361b8108e07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 051439cc93..1a78211823 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -328,8 +328,8 @@ tests.package.test_perl_libwww_perl.TestPerllibwwwperl: *runtime_test
 tests.package.test_perl_mail_dkim.TestPerlMailDKIM: *runtime_test
 tests.package.test_perl_x10.TestPerlX10: *runtime_test
 tests.package.test_perl_xml_libxml.TestPerlXMLLibXML: *runtime_test
-tests.package.test_prosody.TestLua51Prosody: *runtime_test
-tests.package.test_prosody.TestLuajitProsody: *runtime_test
+tests.package.test_prosody.TestProsodyLua51: *runtime_test
+tests.package.test_prosody.TestProsodyLuajit: *runtime_test
 tests.package.test_python.TestPython2: *runtime_test
 tests.package.test_python.TestPython3: *runtime_test
 tests.package.test_python_argh.TestPythonPy2Argh: *runtime_test
