From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:49 -0000
Subject: [Buildroot] [git commit branch/next] uclibc: update uClibc-ng to
	latest version
Message-ID: <20150808105633.EFD8380414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb24d547337bd4486e023037a815d9d86c46f601
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes gcc 5.1 errors and contains all recent
improvements to Xtensa/ARC NPTL/TLS.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in   |    2 +-
 package/uclibc/uclibc.hash |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 14f713c..eee5044 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -65,7 +65,7 @@ config BR2_UCLIBC_VERSION_STRING
 	string
 	default "0.9.33.2"	if BR2_UCLIBC_VERSION_0_9_33
 	default "arc-2015.06-rc1" if BR2_UCLIBC_VERSION_ARC_GIT
-	default "1.0.3"		if BR2_UCLIBC_VERSION_NG
+	default "1.0.4"		if BR2_UCLIBC_VERSION_NG
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 36fa86f..06e1661 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,8 +1,8 @@
 # Locally calculated after checking pgp signature
 sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
 
-# From http://www.uclibc-ng.org/trac/
-sha256  b4c73fe3e7af4eeabf7510ee66ca85f775c3ed44d20b1bcd30c6ac481dd753cd        uClibc-ng-1.0.3.tar.xz
+# From http://www.uclibc-ng.org/
+sha256  c037dbaea685380c75b112b5503778a90fa95ac524728770131aa17e29474915        uClibc-ng-1.0.4.tar.xz
 
 # No hash for the ARC variant, comes from the github-helper
 none	xxx	uClibc-arc-2015.06-rc1.tar.gz
