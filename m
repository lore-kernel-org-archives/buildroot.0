From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 09:22:04 +0200
Subject: [Buildroot] [git commit] package/xkeyboard-config: fix hash
Message-ID: <20190717072034.B7DE481052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=816c10b8e8dad48597a84f6d8f8e0db7806eac24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 2.27 did not update the hash

Fixes:
 - http://autobuild.buildroot.org/results/6afcadda1008771fa32055de64285498815bc4c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/x11r7/xkeyboard-config/xkeyboard-config.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xkeyboard-config/xkeyboard-config.hash b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
index dfe4405067..55a9b28f16 100644
--- a/package/x11r7/xkeyboard-config/xkeyboard-config.hash
+++ b/package/x11r7/xkeyboard-config/xkeyboard-config.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 2a4bbc05fea22151b7a7c8ac2655d549aa9b0486bedc7f5a68c72716343b02f3  xkeyboard-config-2.27.tar.bz2
+sha256 690daec8fea63526c07620c90e6f3f10aae34e94b6db6e30906173480721901f  xkeyboard-config-2.27.tar.bz2
 sha256 6ca90f4b67dced4062894d6d77f4cc39343df9e359fc12f5e5d3c89ef2a3ef6d  COPYING
