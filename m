Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622D6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 02:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB896813E1;
	Tue, 15 Feb 2022 02:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jUJn3rzPq_q; Tue, 15 Feb 2022 02:14:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B50812E4;
	Tue, 15 Feb 2022 02:14:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 001D71BF324
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 02:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E29D8600C6
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 02:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dstRYgk1TyX for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 02:14:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1AEB600B8
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 02:14:55 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 21F2EGhf072041;
 Tue, 15 Feb 2022 10:14:16 +0800 (GMT-8)
 (envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Tue, 15 Feb 2022 10:14:15 +0800
Date: Tue, 15 Feb 2022 10:13:20 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <YgsMQNqzcR1uCli1@APC323>
References: <20220125054956.27492-1-peterlin@andestech.com>
 <20220125054956.27492-3-peterlin@andestech.com>
 <674c1c83-4bcf-3740-8f79-184c1a86cda3@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <674c1c83-4bcf-3740-8f79-184c1a86cda3@benettiengineering.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 21F2EGhf072041
Subject: Re: [Buildroot] [PATCH v2 3/3] DEVELOPERS: add Yu-Chien Lin to
 board/andes
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
Cc: alankao@andestech.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

Thanks for your comments.

> On Thu, Feb 10, 2022 at 12:39:07AM +0100, Giulio Benetti wrote:
> > Hi Peter,
> >
> > I review it now,
> >
> > On 25/01/22 06:49, Yu Chien Peter Lin wrote:
> > > This patch provides defconfig and basic support for the Andes
> > > 45 series RISC-V architecture.
> > >
> > > Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> > > Signed-off-by: Alan Kao <alankao@andestech.com>
> ...
> > >   create mode 100644 board/andes/ae350/patches/opensbi/0001-Disable-PIC-explicitly-for-assembling.patch
> > >   create mode 100644 board/andes/ae350/patches/opensbi/0002-Enable-cache-for-opensbi-jump-mode.patch
> > >   create mode 100644 board/andes/ae350/patches/uboot/0001-Fix-mmc-no-partition-table-error.patch
> > >   create mode 100644 board/andes/ae350/patches/uboot/0002-Prevent-fw_dynamic-from-relocation.patch
> > >   create mode 100644 board/andes/ae350/patches/uboot/0003-Fix-u-boot-proper-booting-issue.patch
> > >   create mode 100644 board/andes/ae350/patches/uboot/0004-Enable-printing-OpenSBI-boot-logo.patch
> >
> > Would it be possible for you to upstream these patches? I mean, do you
> > maintain the uboot, opensbi repositories so you can do that?
> > If yes it would be great having no patches at all here.

We have a plan to upstream some of them if the patch is platform specific.
I'll remove them when the u-boot bumps to the future version.

> > > index 0000000000..5e5d70ab25
> > > --- /dev/null
> > > +++ b/board/andes/ae350/ae350.dts
> ...
> > It's a bit out of topic, but with this .dts ^^^ you define and entire
> > SoC+board, shouldn't it be like a .dtsi file for SoC and a .dts file for
> > board?

We would like to remain in this form until new board is available. Thanks.

Regards,
Yu-Chien Peter Lin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
