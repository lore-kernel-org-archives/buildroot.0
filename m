Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C0FE7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559DE84A43;
	Thu, 12 Dec 2024 21:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ypyMBhxgKJbV; Thu, 12 Dec 2024 21:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7277C84890
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7277C84890;
	Thu, 12 Dec 2024 21:33:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0094F1146
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 735F14248A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mg9URPF1OCMS for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10C7C42414
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10C7C42414
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C59A86E73; Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 22:29:22 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 393c0a1cbe3052fbe61238638bc03762fb9234bd
X-Git-Newrev: 1b7525857029a552e3642ae647b578ada9d8c08d
X-Patchwork-Hint: ignore
Message-Id: <20241212213225.0C59A86E73@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/pcm-tools: fix
 'generating' typo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1b7525857029a552e3642ae647b578ada9d8c08d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d6586d37ba4a155c7325b758217b7ad3a4fd4d5f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcm-tools/pcm-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index 30a8fbf0b6..38725ed8c8 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Don't use the github helper, as pcm-tools uses git attributes that are
-# replaced when gnerating the archive.
+# replaced when generating the archive.
 # 93fc9193a70e2f1f054be554c48f4a4791be5032 is the hash of the 202110 tag.
 PCM_TOOLS_VERSION = 93fc9193a70e2f1f054be554c48f4a4791be5032
 PCM_TOOLS_SITE = https://github.com/opcm/pcm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
