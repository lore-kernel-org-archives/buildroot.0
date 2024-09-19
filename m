Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEC5CE8D58
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 07:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F43606A7;
	Thu, 19 Sep 2024 07:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhqJuZ_7ifKv; Thu, 19 Sep 2024 07:19:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 498A460730
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 498A460730;
	Thu, 19 Sep 2024 07:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC6F61BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBF1F8446B
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIQIsntbyHBD for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 053A1840FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 053A1840FC
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 07:19:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00A6A83C5F; Thu, 19 Sep 2024 07:19:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 09:10:58 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: dc82cd66dcf9c16b66f0f28a00feee27c19e2c9f
X-Git-Newrev: cbe2b1913b7e9f7a5aebfaa95f3609116fd965c5
X-Patchwork-Hint: ignore
Message-Id: <20240919071901.00A6A83C5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] arch/Config.in.arc: fix
 indentation
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbe2b1913b7e9f7a5aebfaa95f3609116fd965c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2ba879cc38733f5160b0729bac1b9e2f001f35e1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
