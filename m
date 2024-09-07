Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C2AEB64CD
	for <buildroot@archiver.kernel.org>; Sat,  7 Sep 2024 17:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C16640118;
	Sat,  7 Sep 2024 17:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fAgECz1n8arU; Sat,  7 Sep 2024 17:19:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB5C740282
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB5C740282;
	Sat,  7 Sep 2024 17:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C691E1BF3C0
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 17:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C08B040282
 for <buildroot@lists.busybox.net>; Sat,  7 Sep 2024 17:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1pvWcMnfCjk for <buildroot@lists.busybox.net>;
 Sat,  7 Sep 2024 17:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D90A540118
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D90A540118
 for <buildroot@buildroot.org>; Sat,  7 Sep 2024 17:19:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAB3C86DE6; Sat,  7 Sep 2024 17:19:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Sep 2024 19:18:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 03fa337577ea7ee1e0f5190e23855eab45a8a585
X-Git-Newrev: 2ba879cc38733f5160b0729bac1b9e2f001f35e1
X-Patchwork-Hint: ignore
Message-Id: <20240907171954.CAB3C86DE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in.arc: fix indentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ba879cc38733f5160b0729bac1b9e2f001f35e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index 388d3496bc..f367c49131 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -3,7 +3,7 @@ choice
 	default BR2_arc770d
 	depends on BR2_arc
 	help
-	    Specific CPU to use
+	  Specific CPU to use
 
 config BR2_arc750d
 	bool "ARC 750D"
@@ -40,12 +40,12 @@ config BR2_archs38_full
 config BR2_archs4x_rel31
 	bool "ARC HS48 rel 31"
 	help
-	   Build for HS48 release 3.1
+	  Build for HS48 release 3.1
 
 config BR2_archs4x
 	bool "ARC HS48"
 	help
-	   Latest release of HS48 processor
+	  Latest release of HS48 processor
 	   - Dual and Quad multiply and MAC operations
 	   - Double-precision FPU
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
