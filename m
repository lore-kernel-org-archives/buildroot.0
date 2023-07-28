Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0204EEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 21:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC8C5614EB;
	Fri, 28 Jul 2023 21:26:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC8C5614EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FdWlDcem0-Hx; Fri, 28 Jul 2023 21:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D3BD60BAC;
	Fri, 28 Jul 2023 21:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D3BD60BAC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB8D21BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C56D160BAC
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C56D160BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-woyAicfOGR for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 21:26:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FB9A60AE1
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 21:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB9A60AE1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3ACA83A3D; Fri, 28 Jul 2023 21:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 23:26:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e9cfd5488a6867f27131b159c5dc932af512d05
X-Git-Newrev: ff14f0ee5ac461b7b9cfd267c9230df1a63dac17
X-Patchwork-Hint: ignore
Message-Id: <20230728212645.F3ACA83A3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add entry for package/mbpoll
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff14f0ee5ac461b7b9cfd267c9230df1a63dac17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index afdd5a4065..cfaadc47a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1603,6 +1603,9 @@ N:	John Faith <jfaith@impinj.com>
 F:	package/python-inflection/
 F:	package/sdbusplus/
 
+N:	Jon Ringle <jringle@gridpoint.com>
+F:	package/mbpoll/
+
 N:	Jonathan Ben Avraham <yba@tkos.co.il>
 F:	arch/Config.in.xtensa
 F:	package/autofs/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
