Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F84C78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA7F406AE;
	Fri, 20 Sep 2024 10:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l55a7Gi7IE9u; Fri, 20 Sep 2024 10:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D85FF42D1B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D85FF42D1B;
	Fri, 20 Sep 2024 10:36:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF901BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9979684C03
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtAvDHc4eyEt for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22FAC84C80
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22FAC84C80
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FC5584124; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:45 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 747fcc5e7a02287caba7805d502b976b1c17de48
X-Git-Newrev: 80c395b83cd93e8a2687d6e1fe45c48dd6680073
X-Patchwork-Hint: ignore
Message-Id: <20240920103607.1FC5584124@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 package/nginx-modsecurity: fix locally typo in hash comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=80c395b83cd93e8a2687d6e1fe45c48dd6680073
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 486358c959b6144d90da5837505608e000f90d6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx-modsecurity/nginx-modsecurity.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx-modsecurity/nginx-modsecurity.hash b/package/nginx-modsecurity/nginx-modsecurity.hash
index 0cd2ee07cd..698dbc7da6 100644
--- a/package/nginx-modsecurity/nginx-modsecurity.hash
+++ b/package/nginx-modsecurity/nginx-modsecurity.hash
@@ -1,4 +1,4 @@
 # From https://github.com/SpiderLabs/ModSecurity-nginx/releases/download/v1.0.3/modsecurity-nginx-v1.0.3.tar.gz.sha256
 sha256  ae811c7208ac029cb7a99d6f63e03d3971797607517187f47620df39c1f78add  modsecurity-nginx-v1.0.3.tar.gz
-# Localy calculated
+# Locally calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
