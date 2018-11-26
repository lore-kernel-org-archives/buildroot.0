From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Nov 2018 22:01:44 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: refresh with
 aarch64_efi_defconfig
Message-ID: <20181202071559.CD701803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ebdf82153f9c6eed401f29a0fd6d8190ec82051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5a100884f6..bd2d5ecad7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -81,6 +81,7 @@ check-package:
             - test-output/*.log
             - test-output/*/.config
             - test-output/*/images/*
+aarch64_efi_defconfig: *defconfig
 acmesystems_aria_g25_128mb_defconfig: *defconfig
 acmesystems_aria_g25_256mb_defconfig: *defconfig
 acmesystems_arietta_g25_128mb_defconfig: *defconfig
