Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B71C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1459B40241;
	Tue,  1 Nov 2022 20:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1459B40241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gS0MTuP6ytF7; Tue,  1 Nov 2022 20:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1864240198;
	Tue,  1 Nov 2022 20:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1864240198
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EA6E1BF307
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 799DA40123
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 799DA40123
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8Rv6XkLJDUK for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:18:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A6344010B
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A6344010B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65E25852D1; Tue,  1 Nov 2022 20:18:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 21:18:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d8371a3fe8c53fa9ff20bd8b5dc904dcc2f3201
X-Git-Newrev: e124a4d1c09ee7ee1f9f33585db1904577feaf35
X-Patchwork-Hint: ignore
Message-Id: <20221101201820.65E25852D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself for docker-compose
 test
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e124a4d1c09ee7ee1f9f33585db1904577feaf35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 06ee5d8056..e1e919ce4f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -554,6 +554,7 @@ F:	package/pkg-golang.mk
 F:	package/rtl8821au/
 F:	package/runc/
 F:	package/tini/
+F:	support/testing/tests/package/test_docker_compose.py
 
 N:	Christophe Priouzeau <christophe.priouzeau@foss.st.com>
 F:	board/stmicroelectronics/stm32f429-disco/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
