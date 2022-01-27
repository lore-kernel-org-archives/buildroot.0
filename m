Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927CAC4332F
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EBBA416C6;
	Thu, 27 Jan 2022 18:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvTJfARJULY5; Thu, 27 Jan 2022 18:33:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF064022A;
	Thu, 27 Jan 2022 18:33:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E349E1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D29D284ED0
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wRVmYRxk1isS for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:32:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4185381AD1
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:32:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E376D829FD; Thu, 27 Jan 2022 18:25:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:29:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c8f4ca025d3040f474977b7597bc22e226dc7b7e
X-Git-Newrev: f1cd0d2cf52511215df0586174a2609c374c0513
X-Patchwork-Hint: ignore
Message-Id: <20220127182514.E376D829FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add entry for
 avrdude to Yegor Yefremov
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1cd0d2cf52511215df0586174a2609c374c0513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 922fdcd47d092e9d2f7000afcb7997a2a2ed2111)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9108d11f3c..1e54d62466 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2737,6 +2737,7 @@ F:	configs/beaglebone_defconfig
 F:	configs/beaglebone_qt5_defconfig
 F:	package/acl/
 F:	package/attr/
+F:	package/avrdude/
 F:	package/boost/
 F:	package/bootstrap/
 F:	package/cannelloni/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
