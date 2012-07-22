From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 19:18:51 +0200
Subject: [Buildroot] [git commit] cleanup trailing white space
Message-ID: <20120722182025.B973D9692E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff2ee34086a24bd23eff054d7a51eaee5e721e11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
