Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA03C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42A9740385;
	Wed,  1 May 2024 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O7KG9k5wZm7c; Wed,  1 May 2024 21:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB164040D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BB164040D;
	Wed,  1 May 2024 21:09:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8FE61BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D601081460
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SFzk9So7V3mt for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BCB0813CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BCB0813CE
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:09:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 06691864F5; Wed,  1 May 2024 21:09:05 +0000 (UTC)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 23:07:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 804abf536e5f8ab86160cc4f2066b42eeeb4ec39
X-Git-Newrev: 74c0cf2152415ab99c93d4d03acd7bfec39fd511
X-Patchwork-Hint: ignore
Message-Id: <20240501210905.06691864F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself for Armadeus boards
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
Content-Type: multipart/mixed; boundary="===============0685797243456818682=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0685797243456818682==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=74c0cf2152415ab99c93d4d03acd7bfec39fd511
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 726641b513..11ffe17f92 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2778,6 +2778,8 @@ F:	support/testing/tests/package/sample_nu.nu
 F:	support/testing/tests/package/test_nu.py
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
+F:	board/armadeus/
+F:	configs/armadeus*
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
 F:	package/python-flask-login/

--===============0685797243456818682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0685797243456818682==--
