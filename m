From: Pwalters <pwalters21@cox.net>
Date: Mon, 15 Jun 2009 20:33:11 +0200
Subject: [Buildroot] [git commit] target/Config.in.arch: fix BR2_ARCH for
	i386 geode variant
Message-ID: <20090617114410.7B4877780C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c239c1944b854cf3c0c1070aa505f16a78c36e73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Signed-off-by: PWalters <pwalters21@cox.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 4a20e44..611210e 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -465,6 +465,7 @@ config BR2_ARCH
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
 	default "i586"		if BR2_x86_pentium_mmx
+	default "i586"		if BR2_x86_geode
 	default "i686"		if BR2_x86_i686
 	default "i686"		if BR2_x86_pentium2
 	default "i686"		if BR2_x86_pentium3
-- 
1.6.0.6
