From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 22 Mar 2012 15:33:43 +0100
Subject: [Buildroot] [git commit] kmod: adjust upstream URL
Message-ID: <20120322150326.6FF179693C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0c4b0266491ae06d3b423a28bda50336a82bb5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kmod still doesn't have a real website, but git tree moved to
kernel.org, so update help to match.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/kmod/Config.in b/package/kmod/Config.in
index f83237e..c5e8ca8 100644
--- a/package/kmod/Config.in
+++ b/package/kmod/Config.in
@@ -3,5 +3,4 @@ config BR2_PACKAGE_KMOD
 	help
 	  handle kernel modules
 
-	  http://git.profusion.mobi/cgit.cgi/kmod.git/
-
+	  http://git.kernel.org/?p=utils/kernel/kmod/kmod.git
