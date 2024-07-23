Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810C4C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 20:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1221A81317;
	Tue, 23 Jul 2024 20:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mRqF1MAsddMs; Tue, 23 Jul 2024 20:31:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB3BE8134D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB3BE8134D;
	Tue, 23 Jul 2024 20:31:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EFBE1BF27E
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88B7140553
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 20:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuDDlAzNZn1f for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 20:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 802A340549
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 802A340549
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 20:31:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69CEE87576; Tue, 23 Jul 2024 20:31:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 22:30:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfa3c1932fd5127b73eae1549a84b9c4125e3e0a
X-Git-Newrev: 7fbc163cf2eb83db289fdf4615c6d5d8ec5665fb
X-Patchwork-Hint: ignore
Message-Id: <20240723203153.69CEE87576@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nilfs-utils: bump to 2.2.11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7fbc163cf2eb83db289fdf4615c6d5d8ec5665fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nilfs-utils/nilfs-utils.hash | 2 +-
 package/nilfs-utils/nilfs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nilfs-utils/nilfs-utils.hash b/package/nilfs-utils/nilfs-utils.hash
index ec71751b00..750243216f 100644
--- a/package/nilfs-utils/nilfs-utils.hash
+++ b/package/nilfs-utils/nilfs-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha512  dd8ab20ee0d6750a6d81f86fe4d1ad94a8a71aa53ee7cd38550ea32fffcc9527db1c75d34f732f0f8f6379a808249f8eec2619e54c595566a3fc434a87d9e66d  nilfs-utils-2.2.9.tar.bz2
+sha512  8c238f961f429c12674695d2481202c8fac4582d04e838ce7244647b8a9997e38b4dafa280314acb57ae40137711c7678de6aaf65708c110028df97c1c76089e  nilfs-utils-2.2.11.tar.bz2
 sha512  4fc92d3998910acb108f81b1aee70a55a572b661a2766d0e57a55e48e2b737eea41415356cbd62593f26aec5797ab9fbb40211d7782b5834b4855ff1ce6ad5f7  COPYING
diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
index 9f9bd091c3..1c8b7e245c 100644
--- a/package/nilfs-utils/nilfs-utils.mk
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NILFS_UTILS_VERSION = 2.2.9
+NILFS_UTILS_VERSION = 2.2.11
 NILFS_UTILS_SOURCE = nilfs-utils-$(NILFS_UTILS_VERSION).tar.bz2
 NILFS_UTILS_SITE = https://nilfs.sourceforge.io/download
 NILFS_UTILS_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
