Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FBCC369CA
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 15:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A13940709;
	Sat, 19 Apr 2025 15:10:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mkG1ia-bV7xq; Sat, 19 Apr 2025 15:10:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3BA040719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3BA040719;
	Sat, 19 Apr 2025 15:10:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2883722F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2468540151
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCXAUtIA-ks5 for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A88A40190
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A88A40190
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F39F85BA3; Sat, 19 Apr 2025 15:10:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 17:02:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d6ab1244a3d8b9c4934caf9cf7810086de7c82f
X-Git-Newrev: 93ffe1a088b0f0be957dba9a33ad6c97279bb995
X-Patchwork-Hint: ignore
Message-Id: <20250419151032.0F39F85BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dejavu: update homepage
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93ffe1a088b0f0be957dba9a33ad6c97279bb995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The currently referenced homepage is a cyber-squatter. Switch to the new
official homepage.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dejavu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
index 5d21e56088..ca549d30e4 100644
--- a/package/dejavu/Config.in
+++ b/package/dejavu/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_DEJAVU
 	  maintaining the original look and feel through the process
 	  of collaborative development, under a Free license.
 
-	  http://dejavu-fonts.org
+	  https://dejavu-fonts.github.io/
 
 if BR2_PACKAGE_DEJAVU
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
