Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69524C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:35:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339A660F9B
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 339A660F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07B3680F26;
	Tue, 26 Oct 2021 18:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d-_qn9XQD7W3; Tue, 26 Oct 2021 18:35:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CB2680E3D;
	Tue, 26 Oct 2021 18:35:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9253A1BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E6234022A
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IYkHNBzAhK9p for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 892F94021A
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:33:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B710288E69; Tue, 26 Oct 2021 18:30:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:18:13 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a447dd793d1c95e857d227b2b267004604bda48b
X-Git-Newrev: b129ea510a50f783cf71fbdbeabcb9b05225b3c2
X-Patchwork-Hint: ignore
Message-Id: <20211026183005.B710288E69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add Giulio
 Benetti to amarula_rk3288_defconfig and asus_rk3288_defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=b129ea510a50f783cf71fbdbeabcb9b05225b3c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add Giulio Benetti to amarula_rk3288_defconfig and asus_rk3288_defconfig.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2a884aad2059a622c6aae161af0b61df402098fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f08c777bb3..8923d57a6b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1018,6 +1018,8 @@ F:	package/webp/
 F:	package/xapian/
 
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
+F:	configs/amarula_vyasa_rk3288_defconfig
+F:	configs/asus_tinker_rk3288_defconfig
 F:	package/at/
 F:	package/binutils/
 F:	package/gcc/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
