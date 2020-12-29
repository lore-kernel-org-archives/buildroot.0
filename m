From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 12:01:14 +0100
Subject: [Buildroot] [PATCH 06/10 v3] WIP: support/testing: update git-hash
 checks with new archive format
In-Reply-To: <cover.1609239666.git.yann.morin.1998@free.fr>
References: <cover.1609239666.git.yann.morin.1998@free.fr>
Message-ID: <74928f23343a32a47253eb2bedceb717ddb874b4.1609239666.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

** WIP: should be squashed into the commit that changes the git backend.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Fazio <vfazio@xes-inc.com>
---
 .../tests/download/br2-external/git-hash/package/bad/bad.hash   | 2 +-
 .../tests/download/br2-external/git-hash/package/good/good.hash | 2 +-
 .../git-partial-sha1-branch-head.hash                           | 2 +-
 .../git-partial-sha1-reachable-by-branch.hash                   | 2 +-
 .../git-partial-sha1-reachable-by-tag.hash                      | 2 +-
 .../git-partial-sha1-tag-itself.hash                            | 2 +-
 .../git-partial-sha1-tag-points-to.hash                         | 2 +-
 .../package/git-sha1-branch-head/git-sha1-branch-head.hash      | 2 +-
 .../git-sha1-reachable-by-branch.hash                           | 2 +-
 .../git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash    | 2 +-
 .../package/git-sha1-tag-itself/git-sha1-tag-itself.hash        | 2 +-
 .../package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash  | 2 +-
 .../package/git-submodule-disabled/git-submodule-disabled.hash  | 2 +-
 .../package/git-submodule-enabled/git-submodule-enabled.hash    | 2 +-
 .../download/br2-external/git-refs/package/git-tag/git-tag.hash | 2 +-
 .../git-refs/package/git-wrong-content/git-wrong-content.hash   | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
index b9e1baec84..a7a31f62d0 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
@@ -1 +1 @@
-sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d_br1.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
index 9e92ab8ab9..13dc10ba9e 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
@@ -1 +1 @@
-sha256  d00ae598e9e770d607621a86766030b42eaa58156cb8d482b043969da7963c23  good-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+sha256  682ad1f39f258bfb35e26f213f3798f44bb8105bb55fad47bdc003113765b650  good-a238b1dfcd825d47d834af3c5223417c8411d90d_br1.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
index 648bcceca0..f4abad1b8a 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  70b76187369e47db69dac02c5696e63b35199cd20490fa473d289dd377774613  git-partial-sha1-branch-head-68c197d0879d485f4f6c.tar.gz
+sha256  c27041b3e874beb0d0218158e7d6507ad1515b684de5eed5fabd0f7205e9718e  git-partial-sha1-branch-head-68c197d0879d485f4f6c_br1.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
index d064362e2c..416460149e 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  9db079b9e215799d59975db7b2b26671eff1932ee6cf1075296f2ace3e2cb746  git-partial-sha1-reachable-by-branch-317406308d9259e2231b.tar.gz
+sha256  1bbba9bf2788bd789ed8da4e47cabbf3467b1f706875b3f6b62df38e08fb9aba  git-partial-sha1-reachable-by-branch-317406308d9259e2231b_br1.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
index 7696086690..3953828634 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  f2ef9772f13a9ef9a2c7cde0795e179defb12320d1747fc8d2408748ef5844c2  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4.tar.gz
+sha256  52d223f3b2d625216c259e9ff949ca8818452a531ba61557dd91f3889c7919d7  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4_br1.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
index e627caf91e..49235645b6 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  721143b41b8e56cfd9025833f1602e900a490627db2504e5b4907baa23e0019e  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61.tar.gz
+sha256  5cfc004b05f48b3fb419a5db4b7239223d670225fbbb91de2ae151c97910b36c  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61_br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
index f957a0e23c..8971426f44 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  0fbf7fe935f962ceaafcf8e0ffd25dd2a83752c3f0fd055a942a53f8c9235fa7  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d.tar.gz
+sha256  0f40d7f39bf2e389cc2ce03c73cc0cc9ded1119378aaa68e2a2ef8597f6fd2f3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d_br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
index 3e8f76d31a..92f6c50dfd 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  a21a2507b6d94ad484e49e3a9ae698f672a57469aab8e1779da77df7c9d4d337  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f.tar.gz
+sha256  3ab67c485ce1825abbbf5db1d90d94dfadc89b30bb740041cfc75fc04021e218  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f_br1.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
index f8d7b5dc48..901836f299 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  8909e76d898e651af0bc23fae4103b87888bfe77448d71aaf1fbec3da97a3ce2  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08.tar.gz
+sha256  a5936d6d6022ea101a6076864a2afa918ab2776764012c4be589027001044041  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08_br1.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
index 0eb0ca0917..e4ee31f165 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  9b20256a3058221a8e91031f11700d9945ea84e8f328fa8e42e1cb9f7a30e3b2  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59.tar.gz
+sha256  c203f968e358ca478d4c5344b1e4ae9bf13f9fb1120f2ed96a12154dd64195a6  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59_br1.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
index 48c1348538..48039ab9a1 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  7d301c1a1054d6aee49193ca9e938f4da561ff73fb01719662865aa38bdc4361  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2.tar.gz
+sha256  57f08e9f3914e79a10e7fb5d346b26fef2773dd22eed0d61fd755e79e62cee93  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2_br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
index 3dcafc2094..1fb7d68d12 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  c1f9f5734529a31140a71c031534460811f001b4db37d26833f386358150ab47  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023.tar.gz
+sha256  1d8b565827137aa21ba37cde382aa291e33a135c697e38dcd31f14e195386327  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023_br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
index 3bd0a44693..e1a0273e12 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
@@ -1,2 +1,2 @@
-sha256  f9d46ff8a1a344c6c31fa4211220f3085c446abd31626232540703158276f22c  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.gz
+sha256  e8e0febc7f1408df22bce2d73d9a30081e03b45e152bc25effd14435ca8b3433  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f_br1.tar.gz
 sha256  ba8b6ddc4726bfb6a05045ebfd8c43263c968ad1bc601bd46a25bc055008eddc  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
index 7f92c652d3..2b2d14b050 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
@@ -1 +1 @@
-sha256  139a34c3c844c844dee74b6746418cfa75fbcc4205794ac8c0b3cd7d55a76792  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.gz
+sha256  176c32f10ad11f290b6251d701835450292ba281eb59c7fb57b244407a55ceab  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f_br1.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
index 1cd0b15f27..9f3b4fc1b9 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
@@ -1,2 +1,2 @@
-sha256  85dcb5bcf9bed496688d0eb01c7a3ce05c5b46b984cc1e9e76a6dbefd976e6b3  git-tag-mytag.tar.gz
+sha256  c66b2366d8ccb1670951012334fe8d48de3358aef39b3da2912b339448fefcde  git-tag-mytag_br1.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
index 47b2b8b7d7..1549b31e38 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
@@ -1,2 +1,2 @@
- sha256  04715901977503d1df650e0959f4d31d8e7b105e2ac99a2182e0652b8f13baa1  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d.tar.gz
+ sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d_br1.tar.gz
  sha256  0000000000000000000000000000000000000000000000000000000000000000  file
-- 
2.25.1
