Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DEEC433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D246B60AB9;
	Thu,  3 Feb 2022 20:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oReCiRGmliMY; Thu,  3 Feb 2022 20:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F35A60A6F;
	Thu,  3 Feb 2022 20:45:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2821C1135
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6945D83EB7
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nL37VPGGeULA for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBFD681D73
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:45:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6CB3E82AE4; Thu,  3 Feb 2022 20:38:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 3 Feb 2022 21:44:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b341f0c91f658484f90c5addd553c579b8d210c1
X-Git-Newrev: 89211450c68df76f3b850c651733c86fb02b40d6
X-Patchwork-Hint: ignore
Message-Id: <20220203203800.6CB3E82AE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723bu: bump to version
 19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89211450c68df76f3b850c651733c86fb02b40d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version fixes a bug that prevents the user from switching from one
access point to another.

Signed-off-by: Doug Brown <doug@schmorgal.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 04bc776a07..1dad7154b4 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  4c7314dccebda1e55ec8dcf0d5ca8915c2490d17a9f56923f25e6e0e945c10cc  rtl8723bu-9ce1c38439f4f574bb7adaf33949835c25536a28.tar.gz
+sha256  1cd658742ce10b21c92877e09cecc98880680d5f150de3845553005abc542977  rtl8723bu-19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index c35fad5832..e490bddf09 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 9ce1c38439f4f574bb7adaf33949835c25536a28
+RTL8723BU_VERSION = 19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
