From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Apr 2018 16:53:13 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] gnupg: fix prompt of
 Config.in.host
Message-ID: <20180408151036.DC068814DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d13986a0ea1cd254932a69c5f1be41680362e157
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

It should be "host gnupg" and not "host-gnupg" to be consistent with
all other Config.in.host options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 083716cdfbc42ac5cd53d3d10ac76a57427c11af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnupg/Config.in.host b/package/gnupg/Config.in.host
index a872ec820f..3686415796 100644
--- a/package/gnupg/Config.in.host
+++ b/package/gnupg/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_GNUPG
-	bool "host-gnupg"
+	bool "host gnupg"
 	help
 	  GnuPG is the GNU project's complete and free implementation
 	  of the OpenPGP standard as defined by RFC4880. GnuPG allows
