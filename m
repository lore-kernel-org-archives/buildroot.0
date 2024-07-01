Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD4CC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 07:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B46E981BC0;
	Mon,  1 Jul 2024 07:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fn77jM4Kdk1; Mon,  1 Jul 2024 07:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 499A0817BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 499A0817BA;
	Mon,  1 Jul 2024 07:12:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 569121BF340
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5466681770
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 07:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyES3LJuUtPn for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 07:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E6E81772
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67E6E81772
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 07:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59DA28376C; Mon,  1 Jul 2024 07:11:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jul 2024 09:06:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cef0948f8245904fbca25a9194d77f3105c1c861
X-Git-Newrev: 4253979a35c1ebccce3f1d0b2bc7c30fc12156e1
X-Patchwork-Hint: ignore
Message-Id: <20240701071151.59DA28376C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eza: bump to version 0.18.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=4253979a35c1ebccce3f1d0b2bc7c30fc12156e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.18.17

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 8765261e7e..3bc55b26ef 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  709507bd46c1e1c4c14d6e34266355d78ae21fe2525f8bf42089cab36ebf0134  eza-0.18.8-cargo2.tar.gz
+sha256  c01f11ba19956108e42244f0b094bbb6bc74c13ea2c68feecf6f0ff2f127df97  eza-0.18.17-cargo2.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index 506e515566..5a44fd7826 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.18.8
+EZA_VERSION = 0.18.17
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = MIT
 EZA_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
