Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCA6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 482408430F;
	Tue, 15 Mar 2022 21:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-_YH-O38pT6; Tue, 15 Mar 2022 21:50:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE72842B9;
	Tue, 15 Mar 2022 21:50:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7AF9C1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7829941606
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:50:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7qtEu2yfsMtP for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7DF7415BA
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AD02784131; Tue, 15 Mar 2022 21:41:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:28:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6a8192081a65fee20b7757ece8880c25c32ee6a
X-Git-Newrev: db2b8a1ce22e9ee458532d2900d4c8cbe96d9ba0
X-Patchwork-Hint: ignore
Message-Id: <20220315214147.AD02784131@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: Remove link to emdebian and
 replace with debian port page
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

commit: https://git.buildroot.net/buildroot/commit/?id=db2b8a1ce22e9ee458532d2900d4c8cbe96d9ba0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the list of full distribution, the FAQ contains a link to Emdebian.
This project stopped receiving updates in 2014 and the main web page does not exist anymore.
This replace the entry with a link to the Debian ports page.

Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/faq-troubleshooting.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 5adf3fa6ce..b08bf9bc4a 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -45,7 +45,7 @@ distribution_ and you should opt for something like:
 
 * http://www.openembedded.org[openembedded]
 * https://www.yoctoproject.org[yocto]
-* http://www.emdebian.org[emdebian]
+* https://www.debian.org/ports/[Debian]
 * https://fedoraproject.org/wiki/Architectures[Fedora]
 * http://en.opensuse.org/Portal:ARM[openSUSE ARM]
 * http://archlinuxarm.org[Arch Linux ARM]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
