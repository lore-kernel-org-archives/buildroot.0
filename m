From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 22 Jul 2012 15:28:31 +0200
Subject: [Buildroot] [PATCH 03/11] cleanup trailing white space
In-Reply-To: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
References: <1342963719-1810-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1342963719-1810-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 64c6dea..e7aec56 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -242,7 +242,7 @@ choice
 	default BR2_mips_1 if BR2_mipsel
 	help
 	  Specific CPU variant to use
-	
+
 	  64bit cabable: 3, 4, 64, 64r2
 	  non-64bit capable: 1, 2, 32, 32r2
 
-- 
1.7.11.2
