Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B9FC10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34EAE6135A;
	Thu,  9 May 2024 20:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Bm5BQKQVyyF; Thu,  9 May 2024 20:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 604F3613FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 604F3613FA;
	Thu,  9 May 2024 20:47:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D08CA1BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D48CC83FF6
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VatTG_jGEfyO for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAEC683FF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAEC683FF9
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E832686A98; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:45:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b11956fb6690e0083eab9f30b5dc146fc40c2d5f
X-Git-Newrev: 8eea9f5783c6ba3e2cba245fcca71dd4017c2fdc
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.E832686A98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: update hashes for
 generated archives
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8eea9f5783c6ba3e2cba245fcca71dd4017c2fdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../testing/tests/download/br2-external/git-hash/package/bad/bad.hash   | 2 +-
 .../br2-external/git-hash/package/export-subst/export-subst.hash        | 2 +-
 .../testing/tests/download/br2-external/git-hash/package/good/good.hash | 2 +-
 .../git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash      | 2 +-
 .../git-partial-sha1-reachable-by-branch.hash                           | 2 +-
 .../git-partial-sha1-reachable-by-tag.hash                              | 2 +-
 .../git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash        | 2 +-
 .../git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash  | 2 +-
 .../git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash     | 2 +-
 .../git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash      | 2 +-
 .../package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash    | 2 +-
 .../git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash       | 2 +-
 .../git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash | 2 +-
 .../git-refs/package/git-submodule-disabled/git-submodule-disabled.hash | 2 +-
 .../git-refs/package/git-submodule-enabled/git-submodule-enabled.hash   | 2 +-
 .../tests/download/br2-external/git-refs/package/git-tag/git-tag.hash   | 2 +-
 .../git-refs/package/git-wrong-content/git-wrong-content.hash           | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
index 709932de98..c3ac6da64a 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/bad/bad.hash
@@ -1 +1 @@
-sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d-git3.tar.gz
+sha256  0000000000000000000000000000000000000000000000000000000000000000  bad-a238b1dfcd825d47d834af3c5223417c8411d90d-git4.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
index 7fc5b42ada..792546d342 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/export-subst/export-subst.hash
@@ -1 +1 @@
-sha256  9d359f9ae9a9e65dd4ccfe7170aa6fda24e17dfc81238972957b4b7fe97168a7  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-git3.tar.gz
+sha256  5ee1800b8fd5f4a0d3e48a0c3a32a988ca974d0ef3c9bc8307ee1ff139cc3f3e  export-subst-0fdb95cf4f3c5ed4003287649cabb33c5f843e26-git4.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
index 44b1d54c54..6909066f99 100644
--- a/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
+++ b/support/testing/tests/download/br2-external/git-hash/package/good/good.hash
@@ -1 +1 @@
-sha256  682ad1f39f258bfb35e26f213f3798f44bb8105bb55fad47bdc003113765b650  good-a238b1dfcd825d47d834af3c5223417c8411d90d-git3.tar.gz
+sha256  32879a888bd3cfc10e108a0309940884aa0b01250fad5912c837d23c9918f8de  good-a238b1dfcd825d47d834af3c5223417c8411d90d-git4.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
index fde03b9131..fa2bf666e5 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-branch-head/git-partial-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  c27041b3e874beb0d0218158e7d6507ad1515b684de5eed5fabd0f7205e9718e  git-partial-sha1-branch-head-68c197d0879d485f4f6c-git3.tar.gz
+sha256  86ab4376a55b9ecd5269adbb43146d28bfc90c785c01dbed11cc6c16fc10406a  git-partial-sha1-branch-head-68c197d0879d485f4f6c-git4.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
index 463fd46848..633b2bb6d4 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-branch/git-partial-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  1bbba9bf2788bd789ed8da4e47cabbf3467b1f706875b3f6b62df38e08fb9aba  git-partial-sha1-reachable-by-branch-317406308d9259e2231b-git3.tar.gz
+sha256  2baa9ab4c5cab2348de03609288c9c874f1f56e4373d3d089e83f381d45d4e68  git-partial-sha1-reachable-by-branch-317406308d9259e2231b-git4.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
index f83496743f..60582b0967 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-reachable-by-tag/git-partial-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  52d223f3b2d625216c259e9ff949ca8818452a531ba61557dd91f3889c7919d7  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4-git3.tar.gz
+sha256  8042df3cc0a7427d1273a846ef5c38ebf589ba7a2ae8158fed3d29f5fea1cad3  git-partial-sha1-reachable-by-tag-46bae5b639e5a18e2cc4-git4.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
index 9041849c80..9fd26d6185 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-itself/git-partial-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  5cfc004b05f48b3fb419a5db4b7239223d670225fbbb91de2ae151c97910b36c  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61-git3.tar.gz
+sha256  be18eb6180f33ad01c09eefa40d8b58e09a9049d90cedd20a51ef2045beb92ad  git-partial-sha1-tag-itself-2b0e0d98a49c97da6a61-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
index c8b469b199..353c8f07f8 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-partial-sha1-tag-points-to/git-partial-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  0f40d7f39bf2e389cc2ce03c73cc0cc9ded1119378aaa68e2a2ef8597f6fd2f3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d-git3.tar.gz
+sha256  36d9064cfd4a028f89b1e482b2543ee15df5ad0076714c175db54f3943f37ca3  git-partial-sha1-tag-points-to-516c9c5f64ec66534d4d-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
index 393baef4ee..64e3ee450f 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-branch-head/git-sha1-branch-head.hash
@@ -1,2 +1,2 @@
-sha256  3ab67c485ce1825abbbf5db1d90d94dfadc89b30bb740041cfc75fc04021e218  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f-git3.tar.gz
+sha256  94d3addcdc2bf76c996a9278f16d0bef966522e2fc1367e0039cac419e51f4ca  git-sha1-branch-head-68c197d0879d485f4f6cee85544722b79e68e59f-git4.tar.gz
 sha256  2c1126513651b0d346a4e6d1bb75ac1c9999217e18026302d27bea47b06c7fb2  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
index 63f18a4066..509cfed768 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-branch/git-sha1-reachable-by-branch.hash
@@ -1,2 +1,2 @@
-sha256  a5936d6d6022ea101a6076864a2afa918ab2776764012c4be589027001044041  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08-git3.tar.gz
+sha256  1ddd9110d10762476e87b7a8c66cc9fa5df0e29a0476e242a68e0493a4b97f1f  git-sha1-reachable-by-branch-317406308d9259e2231bd0d6ddad3de3832bce08-git4.tar.gz
 sha256  fabbc65c442bacb5e69b7adfea6d14fbbfc1327134322efd12771dc84387d507  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
index a0f39cead8..8c75787ae5 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-reachable-by-tag/git-sha1-reachable-by-tag.hash
@@ -1,2 +1,2 @@
-sha256  c203f968e358ca478d4c5344b1e4ae9bf13f9fb1120f2ed96a12154dd64195a6  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59-git3.tar.gz
+sha256  f2903e4b043fca2abb96a4aeabfcd83914c81929a9e880a743f23da86f7c68d8  git-sha1-reachable-by-tag-46bae5b639e5a18e2cc4dc508f080d566baeff59-git4.tar.gz
 sha256  2de87d77a2f226813f2d9bda906e970e4195605cdba6680443c0c04d89c532b6  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
index 1497ecc1d5..0adb526ac7 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-itself/git-sha1-tag-itself.hash
@@ -1,2 +1,2 @@
-sha256  57f08e9f3914e79a10e7fb5d346b26fef2773dd22eed0d61fd755e79e62cee93  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2-git3.tar.gz
+sha256  6a7731130e07292ca92aec57b2ea495318e53403b2d455d1cb0fd1cd256829af  git-sha1-tag-itself-2b0e0d98a49c97da6a618ab36337e2058eb733a2-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
index 2776d43871..870c08fa3a 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-sha1-tag-points-to/git-sha1-tag-points-to.hash
@@ -1,2 +1,2 @@
-sha256  1d8b565827137aa21ba37cde382aa291e33a135c697e38dcd31f14e195386327  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023-git3.tar.gz
+sha256  0f09af0d4b9e0fb5969eab514d6b39ef8433607e92623ca1c641dbf25d7b6518  git-sha1-tag-points-to-516c9c5f64ec66534d4d069c2e408d9ae4dce023-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
index bc05bedd0d..930252ef2d 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
@@ -1,2 +1,2 @@
-sha256  e8e0febc7f1408df22bce2d73d9a30081e03b45e152bc25effd14435ca8b3433  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-git3.tar.gz
+sha256  f04937956fc45ca9bfaf911aa513956369256a6e53e733d9e7e06efb9cf05600  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-git4.tar.gz
 sha256  ba8b6ddc4726bfb6a05045ebfd8c43263c968ad1bc601bd46a25bc055008eddc  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
index e2a626833b..a147a8e1ae 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
@@ -1 +1 @@
-sha256  176c32f10ad11f290b6251d701835450292ba281eb59c7fb57b244407a55ceab  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-git3.tar.gz
+sha256  fd92a10055e233cb8ca857e9b68fa52c57803fc970cb96357a7350f9e8e4302f  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f-git4.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
index a30a070aca..9ebeebb363 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-tag/git-tag.hash
@@ -1,2 +1,2 @@
-sha256  c66b2366d8ccb1670951012334fe8d48de3358aef39b3da2912b339448fefcde  git-tag-mytag-git3.tar.gz
+sha256  92fa45cdb205906f32be4c5bb4f11d09221b63908aab09c6475911cf89f3a0b7  git-tag-mytag-git4.tar.gz
 sha256  6de8772a0a58fa62e2b8c58d4dae55c9db7534ad3b3918ecc849a9008d58f081  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
index 4c7da339d1..c39cd633ee 100644
--- a/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-wrong-content/git-wrong-content.hash
@@ -1,2 +1,2 @@
- sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d-git3.tar.gz
+ sha256  4a230e667227310289438cd7d899276a0d45ca8778abfd043dfc0a10ed2c9085  git-wrong-content-a238b1dfcd825d47d834af3c5223417c8411d90d-git4.tar.gz
  sha256  0000000000000000000000000000000000000000000000000000000000000000  file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
