Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1EAC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 20:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 241D941E48;
	Mon,  4 Dec 2023 20:26:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 241D941E48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXGtxhXwJyNn; Mon,  4 Dec 2023 20:26:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E0941E38;
	Mon,  4 Dec 2023 20:26:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E0941E38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BB271BF977
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2EB441743
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 20:13:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2EB441743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rXl8i_vq3hNy for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41C9E4175F
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41C9E4175F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F500879B9; Mon,  4 Dec 2023 20:13:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Dec 2023 09:37:38 +0100
Subject: [git commit] DEVELOPERS: add Flávio Tapajós for rsyslog
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6358bb3a9bcf8d4c66893e8df513d18bf0022c35
X-Git-Newrev: e6e16a6d1803956b0c10e0d92608980888d0ebd3
X-Patchwork-Hint: ignore
Message-Id: <20231204201330.3F500879B9@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============8100811109418975833=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8100811109418975833==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e6e16a6d1803956b0c10e0d92608980888d0ebd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f26e9bc81..2f3eedf8a0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1078,6 +1078,7 @@ F:	package/python-pymodbus/
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
 F:	configs/asus_tinker-s_rk3288_defconfig
 F:	board/asus/tinker-s/
+F:	package/rsyslog/
 
 N:	Florian Fainelli <f.fainelli@gmail.com>
 F:	package/cpulimit/

--===============8100811109418975833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8100811109418975833==--
