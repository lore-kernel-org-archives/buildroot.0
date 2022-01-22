Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FA6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 13:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79517400D6;
	Sat, 22 Jan 2022 13:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrjuYsW4NPL7; Sat, 22 Jan 2022 13:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA76D40157;
	Sat, 22 Jan 2022 13:21:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29FAB1BF3D5
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 181EC60ACD
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fo8ghO3JYRH6 for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 13:21:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E38CD6068D
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 13:21:17 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1A74240002;
 Sat, 22 Jan 2022 13:21:15 +0000 (UTC)
Date: Sat, 22 Jan 2022 14:21:14 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220122142114.52195666@windsurf>
In-Reply-To: <20220118162413.24664-1-ps.report@gmx.net>
References: <20220118162413.24664-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/rtl8812au-aircrack-ng: bump
 version to 3a6402e
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 18 Jan 2022 17:24:13 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Changelog:
> 
>   47a38b7 Fix kernel 5.15 compilation
>   6fd304f fix libc6_2.34 dependency on build
>   307d694 Merge pull request #898 from CGarces/fix_5.15
>   191f5bc Remove REMAKE_INITRD
>   bd8e44b Add back 8814au support
>   849206d Merge pull request #913 from iyanmv/iyanmv-remove-remake-initrd
>   7bb5114 Fix kernel v5.15+ compiler warnings
>   1b63ee6 Fixed compiler warning for unused function
>   a72835d Fix (test) for IPX header on various distros
>   3a6402e Fix for kernel v3.20
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
>  package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
