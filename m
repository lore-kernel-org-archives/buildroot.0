Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D63DC369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 16:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0514D42ED3;
	Fri, 25 Apr 2025 16:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SimiikNS3IbJ; Fri, 25 Apr 2025 16:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45BCD42F01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45BCD42F01;
	Fri, 25 Apr 2025 16:15:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E2C5127
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84FE842F01
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qNSILiVROBKY for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 16:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C04B142F0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C04B142F0E
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 16:15:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9B578635D; Fri, 25 Apr 2025 16:15:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:14:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e0b65781b28b168c000ce0df200cbe980433559
X-Git-Newrev: 446c09332a8510d793f09759cc2ebd17be6309f2
X-Patchwork-Hint: ignore
Message-Id: <20250425161528.B9B578635D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcc: bump to version 0.34.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============6882461750941228261=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6882461750941228261==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=446c09332a8510d793f09759cc2ebd17be6309f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://github.com/iovisor/bcc/releases/tag/v0.34.0

The 'tests.package.test_bcc' test(s) were run and passed.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bcc/bcc.hash | 2 +-
 package/bcc/bcc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
index 7ed164eda0..e053d7c367 100644
--- a/package/bcc/bcc.hash
+++ b/package/bcc/bcc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  5641b1db0b9ec60a6afd67b4607c790f49e580c207638bb4ebcea2805c6f373b  bcc-v0.31.0-git4.tar.gz
+sha256  58e634b8dcddf1f8f358e6e4e5182ad57999c3ab17cc913e0bf86af157089544  bcc-v0.34.0-git4.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
index d5d72aa9c0..f33fbcbd38 100644
--- a/package/bcc/bcc.mk
+++ b/package/bcc/bcc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCC_VERSION = v0.31.0
+BCC_VERSION = v0.34.0
 BCC_SITE = https://github.com/iovisor/bcc
 BCC_SITE_METHOD = git
 BCC_GIT_SUBMODULES = YES

--===============6882461750941228261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6882461750941228261==--
