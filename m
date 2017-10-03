From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Oct 2017 14:22:30 +0200
Subject: [Buildroot] [git commit] dump1090: fix librtlsdr package name typo
Message-ID: <20171003121609.3BEA580435@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d77bc0dbba9381fe5d7c15e2d3881bd3febae090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/720/720a4b23a47aa6677bde4418f21e6b073a72ea51/
http://autobuild.buildroot.net/results/14e/14edf051d113a6ec54b61738748764adeac7ba9d/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dump1090/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dump1090/Config.in b/package/dump1090/Config.in
index 81fd3f2..c796fae 100644
--- a/package/dump1090/Config.in
+++ b/package/dump1090/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DUMP1090
 	bool "dump1090"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # librtlsdr
-	select BR2_PACKAGE_LIBSRTLSDR
+	select BR2_PACKAGE_LIBRTLSDR
 	help
 	  Dump1090 is a simple Mode S decoder for RTLSDR devices
 
