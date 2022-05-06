Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CEAC433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 19:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1318741952;
	Fri,  6 May 2022 19:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lgfPeCPdJNQ; Fri,  6 May 2022 19:23:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33AE241880;
	Fri,  6 May 2022 19:23:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70F6C1C2742
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 19:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FFA841880
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 19:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RW42yBJGr58S for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 19:23:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A9C141521
 for <buildroot@buildroot.org>; Fri,  6 May 2022 19:23:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6C6D985C01; Fri,  6 May 2022 19:12:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 May 2022 21:19:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b73f5c32af8a5bfc4af9b38dc691d01057f73443
X-Git-Newrev: 688a79620513c9781c4151c23686bcc7a04230c4
X-Patchwork-Hint: ignore
Message-Id: <20220506191229.6C6D985C01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Update entries for Neal Frager
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

commit: https://git.buildroot.net/buildroot/commit/?id=688a79620513c9781c4151c23686bcc7a04230c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add board/zynq, board/zynqmp/kria and the missing defconfigs.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c54b6b5c09..ffb55dee8e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2103,8 +2103,13 @@ F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 
 N:	Neal Frager <neal.frager@amd.com>
+F:	board/zynq/
 F:	board/zynqmp/
+F:	board/zynqmp/kria/
+F:	configs/zynq_zc706_defconfig
 F:	configs/zynqmp_zcu102_defconfig
+F:	configs/zynqmp_zcu106_defconfig
+F:	configs/zynqmp_kria_kv260_defconfig
 
 N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
 F:	package/uacme/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
