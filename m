From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 May 2012 22:16:58 +0200
Subject: [Buildroot] [git commit] target/arch: x86/prescott doesn't define
	BR2_ARCH, fix it
Message-ID: <20120509202849.CC63596C87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67202463b0720d679402c292cefba263da5d6df7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index a42bfd6..6eaa951 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -597,6 +597,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_pentium4
 	default "i686"		if BR2_x86_pentium_m
 	default "i686"		if BR2_x86_pentiumpro
+	default "i686"		if BR2_x86_prescott
 	default "i686"		if BR2_x86_nocona
 	default "i686"		if BR2_x86_core2
 	default "i686"		if BR2_x86_atom
