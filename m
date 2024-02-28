Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F535C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:26:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D46C441713;
	Wed, 28 Feb 2024 21:26:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZcHdkXFoUlm; Wed, 28 Feb 2024 21:26:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15D4A405B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15D4A405B6;
	Wed, 28 Feb 2024 21:26:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F8E71BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DEDC41759
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoF0zGwvBHDb for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B91AD41681
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B91AD41681
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B40B587CE2; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:01:02 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b348beb3585336ce601f6bec69c6d0567186153d
X-Git-Newrev: a643262322436a4cb4dd63cbfceed22a0794683b
X-Patchwork-Hint: ignore
Message-Id: <20240228212548.B40B587CE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 docs/manual/contribute.txt: fix typo
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
Content-Type: multipart/mixed; boundary="===============4344220794350066834=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4344220794350066834==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a643262322436a4cb4dd63cbfceed22a0794683b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

"who sponsored who sponsored" -> "who sponsored"

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f24e85238f67eb65ec5dc7ebde7f0c7cfd3c396b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 15fe36aef0..2b90d13b41 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -259,7 +259,7 @@ separated from it by a plus `+` sign. E.g.:
 +
 `Your-Name Your-Surname <your-name.your-surname+companyname@mail.com>`
 
-* for an individual who sponsored who sponsored the submitted work, use
+* for an individual who sponsored the submitted work, use
   their name and surname:
 +
 `Your-Name Your-Surname <your-name.your-surname+their-name.their-surname@mail.com>`

--===============4344220794350066834==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4344220794350066834==--
