Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76721C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:18:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE3C261507
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 15:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE3C261507
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BA7D60BE9;
	Tue,  5 Oct 2021 15:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eE5jZ4JfmQsp; Tue,  5 Oct 2021 15:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0177F60BDE;
	Tue,  5 Oct 2021 15:18:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1483E1BF315
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 018DF60BE9
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 15:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGuOd3RwGFJw for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 15:18:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AAEA606CB
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 15:18:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6FD7C8FED0; Tue,  5 Oct 2021 15:15:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 16:24:24 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 62b89dc76f6f980580bfe92dc9894bec31099102
X-Git-Newrev: 09e30b70ae6624f90c971e18365a91899cd91f5e
X-Patchwork-Hint: ignore
Message-Id: <20211005151559.6FD7C8FED0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] boot/mv-ddr-marvell: fix
 license file hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=09e30b70ae6624f90c971e18365a91899cd91f5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Commit 2cfdf8b8a269 (boot/mv-ddr-marvell: Bump to HEAD as of 20201207)
forgot to update the hash a a source file that we use as license file.

Fixes: #14221

Reported-by: nyanyamiau@gmail.com
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: D. Olsson <hi@senzilla.io>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f05136090de781d038070b1b197fb868c7c339cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/mv-ddr-marvell/mv-ddr-marvell.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/mv-ddr-marvell/mv-ddr-marvell.hash b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
index e1a86008db..5bfae8af45 100644
--- a/boot/mv-ddr-marvell/mv-ddr-marvell.hash
+++ b/boot/mv-ddr-marvell/mv-ddr-marvell.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  bfab74a625d65238c569b9df282b55c0fc9a1e2d3decedcf194d44774df2ede4  mv-ddr-marvell-305d923e6bc4236cd3b902f6679b0aef9e5fa52d.tar.gz
-sha256  69208236fc322026920b92d1d839ebdc521ca65379bfdb3368a24945e794fc78  ddr3_init.c
+sha256  48bb930b6fbc3f5db72e29c849b096df3868e4a6d2bdc0e2dd3365c768241cd5  ddr3_init.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
