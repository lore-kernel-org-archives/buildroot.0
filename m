From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Dec 2020 15:52:31 +0100
Subject: [Buildroot] [git commit] package/libcap-ng: bump to version 0.8.2
Message-ID: <20201214143746.6398681547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93048218f6fa9a300b1322c94f34725db3f3daf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/stevegrubb/libcap-ng/releases/tag/v0.8.2
https://github.com/stevegrubb/libcap-ng/releases/tag/v0.8.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcap-ng/libcap-ng.hash | 2 +-
 package/libcap-ng/libcap-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index d52f466084..f775ae6fc9 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f14d23b60ae1465b032e4e8cbd4112006572c69a6017d55d5d3c6aad622a9e21  libcap-ng-0.8.tar.gz
+sha256  52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df25891126cb85ae9  libcap-ng-0.8.2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index 03949d740a..88623ae96b 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.8
+LIBCAP_NG_VERSION = 0.8.2
 LIBCAP_NG_SITE = http://people.redhat.com/sgrubb/libcap-ng
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
