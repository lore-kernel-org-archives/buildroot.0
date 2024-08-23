Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A920CE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B0880CE3;
	Fri,  6 Sep 2024 20:06:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bd3TKzx11-hj; Fri,  6 Sep 2024 20:06:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8449380E45
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8449380E45;
	Fri,  6 Sep 2024 20:06:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E14381BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 839C260779
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m01Lr-bC5C9P for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA5A36110E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA5A36110E
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D75CC86EE1; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 19:29:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d54687cc0f61c085cf94b601a37bd4d475515cc2
X-Git-Newrev: 9e15368ba87aeb464e33f857dfea332626929f0e
X-Patchwork-Hint: ignore
Message-Id: <20240906195856.D75CC86EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fcft: update to 3.1.8
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
