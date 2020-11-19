From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 19 Nov 2020 07:22:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/uclibc-ng-test: add hashes
Message-ID: <20201119062201.112901-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/4bb/4bb46976665bea99ac62c86d3953ad025f7f0a96/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/uclibc-ng-test/uclibc-ng-test.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/uclibc-ng-test/uclibc-ng-test.hash

diff --git a/package/uclibc-ng-test/uclibc-ng-test.hash b/package/uclibc-ng-test/uclibc-ng-test.hash
new file mode 100644
index 0000000000..2a73237f06
--- /dev/null
+++ b/package/uclibc-ng-test/uclibc-ng-test.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  1f22e4143413550d64cbde193de388e8884eb7398cd41d3835e5d8a06a488423  uclibc-ng-test-c64d6ac77f0e745c70e76024212c72e4bbe2091a.tar.gz
+sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
-- 
2.27.0
