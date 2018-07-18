From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 11:57:42 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: update with the addition
 of olimex_a10_olinuxino_lime_defconfig
Message-ID: <20180718095331.E3DB4888A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d5e0e088241382ca9554caa85555fbc3a28022b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index de2abdd4ce..6385fffc70 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -167,6 +167,7 @@ nitrogen6sx_defconfig: *defconfig
 nitrogen6x_defconfig: *defconfig
 nitrogen7_defconfig: *defconfig
 odroidc2_defconfig: *defconfig
+olimex_a10_olinuxino_lime_defconfig: *defconfig
 olimex_a13_olinuxino_defconfig: *defconfig
 olimex_a20_olinuxino_lime2_defconfig: *defconfig
 olimex_a20_olinuxino_lime_defconfig: *defconfig
