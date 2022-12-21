Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4030FC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 16:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1A9B4193A;
	Wed, 21 Dec 2022 16:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1A9B4193A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7_J0jRcRBFPs; Wed, 21 Dec 2022 16:02:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC7EF4191B;
	Wed, 21 Dec 2022 16:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC7EF4191B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A2C21BF23C
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 16:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82B0D60BB6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 16:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82B0D60BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sCQHnkTGmpxm for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 16:02:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCE8E60BB1
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 16:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCE8E60BB1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA9F686BCA; Wed, 21 Dec 2022 16:02:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 17:02:08 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 914c6fd93a461a376244c48b9e298c566608a543
X-Git-Newrev: 3ecd8dca4c2ed0332720d4c7d882743ef6eb2a9a
X-Patchwork-Hint: ignore
Message-Id: <20221221160248.AA9F686BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: add Thomas
 Claveirole to package vuejs
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

commit: https://git.buildroot.net/buildroot/commit/?id=3ecd8dca4c2ed0332720d4c7d882743ef6eb2a9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ba7b0bf52bf3a749fc280d4ad5b743b5ee180828)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 113d7f5ca4..25f70967d7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2654,6 +2654,7 @@ F:	package/x265/
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
 F:	package/openlayers/
+F:	package/vuejs/
 F:	package/vuejs-router/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
