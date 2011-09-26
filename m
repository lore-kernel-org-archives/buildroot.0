From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Sep 2011 22:17:12 +0200
Subject: [Buildroot] [git commit] kexec: tweak zlib option name
Message-ID: <20110926204530.F369A8DA9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62fc4c0f77a4c042704468c1ecd40d7776f9a0bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match other _ZLIB options.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kexec/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index f028480..6f10b89 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_KEXEC
 	  http://www.kernel.org/pub/linux/kernel/people/horms/kexec-tools/
 
 config BR2_PACKAGE_KEXEC_ZLIB
-	bool "Kexec with zlib support"
+	bool "zlib support"
 	depends on BR2_PACKAGE_KEXEC
 	select BR2_PACKAGE_ZLIB
 	help
