From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Aug 2013 12:15:32 +0200
Subject: [Buildroot] [git commit] kexec: fix homepage URL
Message-ID: <20130829102210.5EA579B3E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=313dd5d5f21790715182f4e797a32a10c932152e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old one gives 404 error.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kexec/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 886144f..66bc343 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_KEXEC
 	  Kexec is a user space utiltity for loading another kernel
 	  and asking the currently running kernel to do something with it.
 
-	  http://www.kernel.org/pub/linux/kernel/people/horms/kexec-tools/
+	  https://www.kernel.org/pub/linux/utils/kernel/kexec/
 
 config BR2_PACKAGE_KEXEC_ZLIB
 	bool "zlib support"
