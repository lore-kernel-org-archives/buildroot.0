From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  9 May 2012 13:19:04 -0300
Subject: [Buildroot] [PATCH] target/arch: x86/prescott doesn't define
	BR2_ARCH, fix it
Message-ID: <1336580344-24282-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 target/Config.in.arch |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 3b787ad..25ff750 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -590,6 +590,7 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_pentium4
 	default "i686"		if BR2_x86_pentium_m
 	default "i686"		if BR2_x86_pentiumpro
+	default "i686"		if BR2_x86_prescott
 	default "i686"		if BR2_x86_nocona
 	default "i686"		if BR2_x86_core2
 	default "i686"		if BR2_x86_atom
-- 
1.7.3.4
