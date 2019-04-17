From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 17 Apr 2019 21:53:54 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: add andes_ae3xx_defconfig
Message-ID: <20190417195010.C2FF58E16E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee113235cb608d3c68071e948bd5755321a38bbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was forgotten when this defconfig was added.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7d2dd50afa..424e7e43af 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -91,6 +91,7 @@ acmesystems_arietta_g25_128mb_defconfig: { extends: .defconfig }
 acmesystems_arietta_g25_256mb_defconfig: { extends: .defconfig }
 amarula_a64_relic_defconfig: { extends: .defconfig }
 amarula_vyasa_rk3288_defconfig: { extends: .defconfig }
+andes_ae3xx_defconfig: { extends: .defconfig }
 arcturus_ucls1012a_defconfig: { extends: .defconfig }
 arcturus_ucp1020_defconfig: { extends: .defconfig }
 arm_foundationv8_defconfig: { extends: .defconfig }
