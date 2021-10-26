Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13AE4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:34:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE0A160E05
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 18:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CE0A160E05
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C94D40513;
	Tue, 26 Oct 2021 18:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KrJyMmkZUjE9; Tue, 26 Oct 2021 18:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AA7340294;
	Tue, 26 Oct 2021 18:34:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 18AC71BF9AC
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0530F4021A
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 18:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6llyKZOrJGW2 for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 18:33:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C22444011F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 18:33:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EB91588E56; Tue, 26 Oct 2021 18:29:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 20:18:00 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 6b471a330e54c1c2ff2a66e13e8ddfd98eeee33c
X-Git-Newrev: 2ddedbda677e27d4e31116e500dcf0aada0e6ebb
X-Patchwork-Hint: ignore
Message-Id: <20211026182958.EB91588E56@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] DEVELOPERS: add Giulio
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ddedbda677e27d4e31116e500dcf0aada0e6ebb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Add Giulio Benetti to amarula_rk3288_defconfig and asus_rk3288_defconfig.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2a884aad2059a622c6aae161af0b61df402098fc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1bd01d3614..f3cfcf9696 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1046,6 +1046,8 @@ F:	package/webp/
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
