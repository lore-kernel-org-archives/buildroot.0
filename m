Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C98C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:34:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BBD60E05
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00BBD60E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD7ED4040E;
	Tue, 26 Oct 2021 18:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVR_D8Ip79RK; Tue, 26 Oct 2021 18:34:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B68A04040A;
	Tue, 26 Oct 2021 18:34:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3903F1BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35A8A60799
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gdCgkBhhoynY for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 927CB60692
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C0D6988E79; Tue, 26 Oct 2021 18:30:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:18:27 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: b129ea510a50f783cf71fbdbeabcb9b05225b3c2
X-Git-Newrev: 44c12a4ea16d70c7c66823b524256839b951a227
X-Patchwork-Hint: ignore
Message-Id: <20211026183005.C0D6988E79@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add Giulio
 Benetti to erlang-jiffy package
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

commit: https://git.buildroot.net/buildroot/commit/?id=44c12a4ea16d70c7c66823b524256839b951a227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add Giulio Benetti to erlang-jiffy package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f36483126e38d097041a17d4e0e916c19d8651ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8923d57a6b..f55ee361aa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1022,6 +1022,7 @@ F:	configs/amarula_vyasa_rk3288_defconfig
 F:	configs/asus_tinker_rk3288_defconfig
 F:	package/at/
 F:	package/binutils/
+F:	package/erlang-jiffy/
 F:	package/gcc/
 F:	package/harfbuzz/
 F:	package/libfuse3/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
