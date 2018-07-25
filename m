From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 22:56:04 +0200
Subject: [Buildroot] [git commit] package/crda: update website URL
Message-ID: <20180725205059.A586B8A3B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abc6db8b66ff451f41204de488756929657f0d8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now Linux wireless infos are on corresponding wiki.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crda/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/crda/Config.in b/package/crda/Config.in
index b9a2613f04..469fa77f6f 100644
--- a/package/crda/Config.in
+++ b/package/crda/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_CRDA
 	  query and apply the regulatory domain settings wireless
 	  devices may operate within for a given location.
 
-	  http://linuxwireless.org/en/developers/Regulatory/CRDA
+	  https://wireless.wiki.kernel.org/en/developers/regulatory/crda
 
 comment "crda needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
