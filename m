From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 15:24:01 +0100
Subject: [Buildroot] [git commit branch/next] ltp-testsuite: bump to version
	20150903
Message-ID: <20151117144148.61144804B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eba26d53d2db1822b20f134bb20b07365a12c38f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/ltp-testsuite.hash |    6 ++++--
 package/ltp-testsuite/ltp-testsuite.mk   |    2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 5923daf..d60b8a4 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,4 @@
-# Locally computed:
-sha256  ad504e6697b964787f51caad6d8a916caa367f241ac602545548488195216a80  ltp-full-20150420.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20150903/ltp-full-20150903.tar.xz.md5
+md5 4ee849923b69f79b5208e71f3ed20484  ltp-full-20150903.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20150903/ltp-full-20150903.tar.xz.sha1
+sha1 d39bb3a41bfd1fd584703cf066fb2e935af0c00a  ltp-full-20150903.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 64467de..78dc9f4 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20150420
+LTP_TESTSUITE_VERSION = 20150903
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPLv2 GPLv2+
