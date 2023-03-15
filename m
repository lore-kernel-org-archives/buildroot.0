Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE28CC74A5B
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 21:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F15F41B54;
	Thu, 16 Mar 2023 21:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F15F41B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 062Eltwnf1Y9; Thu, 16 Mar 2023 21:37:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3634C41B1C;
	Thu, 16 Mar 2023 21:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3634C41B1C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2BCE1BF31B
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CAA7820CD
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CAA7820CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRbQt4nbqLdj for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 21:36:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E707C820C1
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 21:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E707C820C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D74FA87495; Thu, 16 Mar 2023 21:36:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 18:17:14 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 4e4539b2ae4621573a515821ed5657c652e0a32a
X-Git-Newrev: 57c17cdf99498f8e2bfbe1aa26665c96ea70b73d
X-Patchwork-Hint: ignore
Message-Id: <20230316213653.D74FA87495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: add Heiko
 Thiery for package/rauc
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
Content-Type: multipart/mixed; boundary="===============5473169403077885159=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5473169403077885159==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=57c17cdf99498f8e2bfbe1aa26665c96ea70b73d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 6bec87810252d123f768af03e0e2ab53d2b61f03)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f8a85109fa..6dc0d4a01d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1185,6 +1185,7 @@ F:	package/libnetconf2/
 F:	package/libyang/
 F:	package/linuxptp/
 F:	package/netopeer2/
+F:	package/rauc/
 F:	package/sysrepo/
 
 N:	Hervé Codina <herve.codina@bootlin.com>

--===============5473169403077885159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5473169403077885159==--
