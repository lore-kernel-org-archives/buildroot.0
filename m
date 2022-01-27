Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49038C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 18:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3E5184ECB;
	Thu, 27 Jan 2022 18:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pLbbpH5FD1zV; Thu, 27 Jan 2022 18:32:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 186EE84EE4;
	Thu, 27 Jan 2022 18:32:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C28E1BF3EA
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C530984ED0
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 18:32:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4Me3PuW9kEv for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7AFD81AD1
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 18:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6F52E829FD; Thu, 27 Jan 2022 18:25:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 19:29:43 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 213d4e125ddb398cacbe4a0aec4f631f3ca1d55c
X-Git-Newrev: a19f45e6428f538b2cce3b71ee2efde717cf4624
X-Patchwork-Hint: ignore
Message-Id: <20220127182510.6F52E829FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] DEVELOPERS: add entry for
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

commit: https://git.buildroot.net/buildroot/commit/?id=a19f45e6428f538b2cce3b71ee2efde717cf4624
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 922fdcd47d092e9d2f7000afcb7997a2a2ed2111)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index de7d2c3fbf..1775b75791 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2883,6 +2883,7 @@ F:	configs/beaglebone_defconfig
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
