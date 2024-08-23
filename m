Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57549C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 17:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230EC84119;
	Fri, 23 Aug 2024 17:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMOz8fJppDUu; Fri, 23 Aug 2024 17:33:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F77184117
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F77184117;
	Fri, 23 Aug 2024 17:33:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 460B81BF314
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 331D0412D0
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 17:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0QlG3XDHQAQ for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 17:32:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C3674129C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C3674129C
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 17:32:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9281286468; Fri, 23 Aug 2024 17:32:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:29:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d54687cc0f61c085cf94b601a37bd4d475515cc2
X-Git-Newrev: 9e15368ba87aeb464e33f857dfea332626929f0e
X-Patchwork-Hint: ignore
Message-Id: <20240823173252.9281286468@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fcft: update to 3.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e15368ba87aeb464e33f857dfea332626929f0e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

See here for a changelog:
https://codeberg.org/dnkl/fcft/src/branch/master/CHANGELOG.md#3-1-8

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fcft/fcft.hash | 2 +-
 package/fcft/fcft.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
index 96d885db1d..431f2218c6 100644
--- a/package/fcft/fcft.hash
+++ b/package/fcft/fcft.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  904f40d749d198d97c46c5a459cd3c53fe92f008cf1e3e61949f6cf3036a78b7  3.1.6.tar.gz
+sha256  f48c793f354b8be95477e475dde7c98ac9d2628c52ecb42029dc6d20b52d787c  3.1.8.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
index 538d8a0748..62c85a15c5 100644
--- a/package/fcft/fcft.mk
+++ b/package/fcft/fcft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FCFT_VERSION = 3.1.6
+FCFT_VERSION = 3.1.8
 FCFT_SOURCE = $(FCFT_VERSION).tar.gz
 FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
 FCFT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
