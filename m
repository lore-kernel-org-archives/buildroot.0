From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Apr 2014 08:34:14 +0200
Subject: [Buildroot] [git commit] sockit board: Fix readme.txt
Message-ID: <20140430063702.EDBE39C9F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f59421623ce2779595f49c553948268b3698374f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Config name has changed.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/altera/sockit/readme.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/altera/sockit/readme.txt b/board/altera/sockit/readme.txt
index f2e420c..b6da489 100644
--- a/board/altera/sockit/readme.txt
+++ b/board/altera/sockit/readme.txt
@@ -41,10 +41,10 @@ How to build it
 Configure Buildroot
 -------------------
 
-The arrow_sockit_defconfig configuration is a minimal configuration with
+The altera_sockit_defconfig configuration is a minimal configuration with
 all that is required to bring the SoCkit :
 
-  $ make arrow_sockit_defconfig
+  $ make altera_sockit_defconfig
 
 Build everything
 ----------------
