Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D202BC83F15
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 06:29:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E85641900;
	Wed, 30 Aug 2023 06:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E85641900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Y-LBRkcXyew; Wed, 30 Aug 2023 06:29:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA7A3418B9;
	Wed, 30 Aug 2023 06:29:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA7A3418B9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9A7081BF41D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 825EF41562
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 825EF41562
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OU5FLuiXFXZv for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 06:29:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAF52408A7
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 06:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAF52408A7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB1048652B; Wed, 30 Aug 2023 06:29:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 08:16:02 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: c515e82f232366e2b328db82affe652c0cf5f96f
X-Git-Newrev: 531c8b75aca3243ca1006080144fa11f9c3ce6a5
X-Patchwork-Hint: ignore
Message-Id: <20230830062912.BB1048652B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] DEVELOPERS: update email
 address for Pieterjan Camerlynck
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

commit: https://git.buildroot.net/buildroot/commit/?id=531c8b75aca3243ca1006080144fa11f9c3ce6a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Pieterjan Camerlynck <pieterjanca@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit abd0b56294e77098e233eff0c906bde6b7d7f2f8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 324fa0733c..ed31497f89 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2405,7 +2405,7 @@ F:	package/tree/
 N:	Pieter De Gendt <pieter.degendt@gmail.com>
 F:	package/libvips/
 
-N:	Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
+N:	Pieterjan Camerlynck <pieterjanca@gmail.com>
 F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
