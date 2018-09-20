From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 22:10:54 +0200
Subject: [Buildroot] [git commit] boot/at91bootstrap3: add upstream URL in
 Config.in help text
Message-ID: <20180920201049.95299886BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8084c33b39a64c6d2906296d042263a348fc0c99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap3/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 614363c9a6..f6c310af23 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -10,6 +10,8 @@ config BR2_TARGET_AT91BOOTSTRAP3
 	  - Physical media algorithm such as DataFlash, NandFlash, NOR
 	    Flash...
 
+	  https://www.at91.com/linux4sam/bin/view/Linux4SAM/AT91Bootstrap
+
 if BR2_TARGET_AT91BOOTSTRAP3
 
 choice
