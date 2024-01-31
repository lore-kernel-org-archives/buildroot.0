Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F2FC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 20:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D014B60F78;
	Wed, 31 Jan 2024 20:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D014B60F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHSSVOlO0EiT; Wed, 31 Jan 2024 20:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3949F60B6A;
	Wed, 31 Jan 2024 20:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3949F60B6A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 224E51BF5A4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0853960B6A
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 20:25:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0853960B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2sEWAMKii-4 for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 20:25:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4087160F33
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 20:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4087160F33
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2678B80E0A; Wed, 31 Jan 2024 20:25:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 21:23:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef5d3327a1f030924cb5f000d568fc69f7e7ec53
X-Git-Newrev: f24e85238f67eb65ec5dc7ebde7f0c7cfd3c396b
X-Patchwork-Hint: ignore
Message-Id: <20240131202531.2678B80E0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/contribute.txt: fix typo
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
Content-Type: multipart/mixed; boundary="===============7547399178905166504=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7547399178905166504==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f24e85238f67eb65ec5dc7ebde7f0c7cfd3c396b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"who sponsored who sponsored" -> "who sponsored"

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 15fe36aef0..2b90d13b41 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -259,7 +259,7 @@ separated from it by a plus `+` sign. E.g.:
 +
 `Your-Name Your-Surname <your-name.your-surname+companyname@mail.com>`
 
-* for an individual who sponsored who sponsored the submitted work, use
+* for an individual who sponsored the submitted work, use
   their name and surname:
 +
 `Your-Name Your-Surname <your-name.your-surname+their-name.their-surname@mail.com>`

--===============7547399178905166504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7547399178905166504==--
