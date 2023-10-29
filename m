Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2A8C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 20:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4698970935;
	Sun, 29 Oct 2023 20:18:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4698970935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ek8VGW6NQOMb; Sun, 29 Oct 2023 20:18:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9840B7062A;
	Sun, 29 Oct 2023 20:18:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9840B7062A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51B1E1BF870
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28D10430CA
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 20:18:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28D10430CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lHtDm0Yy0z_W for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 20:18:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12FBD430C0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 20:18:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12FBD430C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF46F86134; Sun, 29 Oct 2023 20:18:51 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 19:50:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a51a07a9175cd564fffa89a6b8b851c258384a0
X-Git-Newrev: 750392e95e480d0b6f9facb266187b5cd9bb3eb2
X-Patchwork-Hint: ignore
Message-Id: <20231029201851.EF46F86134@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/licheepi_zero: rename with
 manufacturer prefix
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

commit: https://git.buildroot.net/buildroot/commit/?id=750392e95e480d0b6f9facb266187b5cd9bb3eb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 72c653367daa (board/licheepi_zero: move board files to their own
directory) forgot to rename the defconfig file, even though the
readme.txt was updated.

Do the rename now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/{licheepi_zero_defconfig => sipeed_licheepi_zero_defconfig} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/configs/licheepi_zero_defconfig b/configs/sipeed_licheepi_zero_defconfig
similarity index 100%
rename from configs/licheepi_zero_defconfig
rename to configs/sipeed_licheepi_zero_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
