Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA5AC64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 20:03:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3956179A;
	Thu,  9 Mar 2023 20:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D3956179A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b1LT17bsWH-A; Thu,  9 Mar 2023 20:03:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F4B61795;
	Thu,  9 Mar 2023 20:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F4B61795
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95AA71BF410
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7126A405B0
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 20:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7126A405B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BEg5m3HL7ZgG for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 20:03:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD1F540483
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 20:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD1F540483
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A94CE86B54; Thu,  9 Mar 2023 20:03:06 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 21:02:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a29c4f4118e42420ebb64b7e00cfb4a826216c1
X-Git-Newrev: 6bec87810252d123f768af03e0e2ab53d2b61f03
X-Patchwork-Hint: ignore
Message-Id: <20230309200306.A94CE86B54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Heiko Thiery for
 package/rauc
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
Content-Type: multipart/mixed; boundary="===============7838963252345275279=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7838963252345275279==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6bec87810252d123f768af03e0e2ab53d2b61f03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6256576e02..9670302a78 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1253,6 +1253,7 @@ F:	package/libnetconf2/
 F:	package/libyang/
 F:	package/linuxptp/
 F:	package/netopeer2/
+F:	package/rauc/
 F:	package/sysrepo/
 
 N:	Hervé Codina <herve.codina@bootlin.com>

--===============7838963252345275279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7838963252345275279==--
