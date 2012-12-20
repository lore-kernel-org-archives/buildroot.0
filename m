From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Dec 2012 15:15:24 +0100
Subject: [Buildroot] [git commit] arch: fix BR2_ARCH for generic target
	variant
Message-ID: <20121220162903.41EAF9A3D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2a27ad3d796720c6be79f13f0bc58e595584aa35
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Richard Braun <rbraun@sceen.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in.x86 |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index d2e0807..ce30605 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -173,6 +173,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_athlon
 	default "i686"		if BR2_x86_athlon_4
 	default "x86_64"	if BR2_x86_64
+	default "i386"		if BR2_x86_generic
 
 config BR2_ENDIAN
 	default "LITTLE"
