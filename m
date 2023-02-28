Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6058DC6FA8E
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 16:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AFF181C18;
	Tue, 28 Feb 2023 16:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AFF181C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZnNVT2v6Bu-i; Tue, 28 Feb 2023 16:17:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A2EB81E3A;
	Tue, 28 Feb 2023 16:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A2EB81E3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 390EE1BF95D
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1032A408FB
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 16:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1032A408FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l75r_NqHHtt7 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 16:16:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11D1A40872
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 16:16:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11D1A40872
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F29FA86D47; Tue, 28 Feb 2023 16:16:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 17:16:24 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: cbff67534b32f8cbdad108ded4df0aacbfa42e0f
X-Git-Newrev: f5e528e048c44e6abbd0ac52d044cbc1a083d1f4
X-Patchwork-Hint: ignore
Message-Id: <20230228161657.F29FA86D47@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: update e-mail
 for Frank Vanbever
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5e528e048c44e6abbd0ac52d044cbc1a083d1f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 416213be39c6adb860a9d3e85f0a634139c27cac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ff3c6e5dc..3c4bcdb223 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1027,7 +1027,7 @@ F:	package/ucl/
 F:	package/upx/
 F:	package/zxing-cpp/
 
-N:	Frank Vanbever <frank.vanbever@essensium.com>
+N:	Frank Vanbever <frank.vanbever@mind.be>
 F: 	package/elixir/
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
