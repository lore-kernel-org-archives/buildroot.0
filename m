Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCF7C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 16:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 174ED4191C;
	Wed, 21 Dec 2022 16:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 174ED4191C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wc-M0tyum8xr; Wed, 21 Dec 2022 16:04:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35ED541912;
	Wed, 21 Dec 2022 16:04:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35ED541912
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BF9F1BF94D
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 16:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F28B41919
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 16:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F28B41919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vmVZo9sjesjB for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 16:03:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A67241912
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 16:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A67241912
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46DFD86BE4; Wed, 21 Dec 2022 16:03:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 17:02:04 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 48cc7c655360890d8197493ffacea9c1450cac53
X-Git-Newrev: 33482a73b98b30ca1c864325e1d74d2283463fc8
X-Patchwork-Hint: ignore
Message-Id: <20221221160354.46DFD86BE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] DEVELOPERS: add Thomas
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

commit: https://git.buildroot.net/buildroot/commit/?id=33482a73b98b30ca1c864325e1d74d2283463fc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ba7b0bf52bf3a749fc280d4ad5b743b5ee180828)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4f862befb0..1d63fe6250 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2760,6 +2760,7 @@ F:	package/x265/
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
