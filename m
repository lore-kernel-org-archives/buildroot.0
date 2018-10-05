From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 13:41:56 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] boot/at91bootstrap3: add
 upstream URL in Config.in help text
Message-ID: <20181005114121.5BBD68D250@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2cab577b4811c78c26fab21e43f068953a2967de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8084c33b39a64c6d2906296d042263a348fc0c99)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/at91bootstrap3/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 237deb929c..f82a0e5edc 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -8,6 +8,8 @@ config BR2_TARGET_AT91BOOTSTRAP3
 	  - Peripheral drivers such as PIO, PMC or SDRAMC...
 	  - Physical media algorithm such as DataFlash, NandFlash, NOR Flash...
 
+	  https://www.at91.com/linux4sam/bin/view/Linux4SAM/AT91Bootstrap
+
 if BR2_TARGET_AT91BOOTSTRAP3
 
 choice
