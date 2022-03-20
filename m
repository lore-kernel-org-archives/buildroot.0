Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1984C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 21:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 747C9402F2;
	Sun, 20 Mar 2022 21:30:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PO2f1omhjhd6; Sun, 20 Mar 2022 21:30:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45AC74023F;
	Sun, 20 Mar 2022 21:30:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBB0F1BF3C9
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9F1360ADE
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 21:29:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZCwkL0TasJ91 for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 21:29:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA6D460AD2
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 21:29:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A095384680; Sun, 20 Mar 2022 21:21:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 22:25:36 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 816861524a079658040d6e059743697affdeafce
X-Git-Newrev: e4667ddcc8608b363c04433c166e2c38d6416acc
X-Patchwork-Hint: ignore
Message-Id: <20220320212105.A095384680@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] docs/manual: Remove link
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4667ddcc8608b363c04433c166e2c38d6416acc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
