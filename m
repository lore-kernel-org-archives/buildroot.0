Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3712C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 20:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A07E882ACD;
	Mon,  7 Mar 2022 20:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tB7_QNvQGF8b; Mon,  7 Mar 2022 20:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC5DD82A4F;
	Mon,  7 Mar 2022 20:36:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B89CF1BF3A0
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99FF3416AB
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 20:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYi85al4v64i for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 20:36:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53361416A5
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 20:36:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F170360004;
 Mon,  7 Mar 2022 20:36:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nRK5R-0010Wg-40; Mon, 07 Mar 2022 21:36:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Simon Doppler <dopsi@dopsi.ch>
References: <20220307141321.307200-1-dopsi@dopsi.ch>
Date: Mon, 07 Mar 2022 21:36:09 +0100
In-Reply-To: <20220307141321.307200-1-dopsi@dopsi.ch> (Simon Doppler's message
 of "Mon, 7 Mar 2022 15:13:21 +0100")
Message-ID: <87h7895wli.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] docs/manual: Document Kconfig requirements
 for uboot
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

>>>>> "Simon" == Simon Doppler <dopsi@dopsi.ch> writes:

 > When using uboot's legacy build system, the 'make uboot-menuconfig'
 > and 'make uboot-savedefconfig' targets are not available as they
 > are created by 'kconfig-package'.

 > Signed-off-by: Simon Doppler <dopsi@dopsi.ch>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
