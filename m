Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6ABC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41510408E8;
	Sun, 20 Mar 2022 21:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CcTFJV6KMovW; Sun, 20 Mar 2022 21:26:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8BE408DF;
	Sun, 20 Mar 2022 21:26:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A35821BF97A
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 903F260ADE
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIJ9cjjbQybf for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:26:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0DE160AD2
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:26:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9E11E8463A; Sun, 20 Mar 2022 21:17:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:25:45 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7b2625c038650ca986aba5b5979d5212552b92e4
X-Git-Newrev: 21278889daf2b899b1b416f259ca6ae839abf060
X-Patchwork-Hint: ignore
Message-Id: <20220320211733.9E11E8463A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] docs/manual: Remove link
 to emdebian and replace with debian port page
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

commit: https://git.buildroot.net/buildroot/commit/?id=21278889daf2b899b1b416f259ca6ae839abf060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

In the list of full distribution, the FAQ contains a link to Emdebian.
This project stopped receiving updates in 2014 and the main web page does not exist anymore.
This replace the entry with a link to the Debian ports page.

Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit db2b8a1ce22e9ee458532d2900d4c8cbe96d9ba0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
