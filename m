Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EF7C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 12:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01EB940B14;
	Thu, 17 Mar 2022 12:14:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7oBu4pNbuZA5; Thu, 17 Mar 2022 12:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC0514046D;
	Thu, 17 Mar 2022 12:14:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97AFB1BF36E
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 947E58411E
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:14:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etxK6fLQxMbu for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 12:14:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EE7483ED4
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:14:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D2AE3240005;
 Thu, 17 Mar 2022 12:14:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nUp0x-00Cx0J-R9; Thu, 17 Mar 2022 13:13:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Simon Doppler <dopsi@dopsi.ch>
References: <20220307141321.307200-1-dopsi@dopsi.ch>
Date: Thu, 17 Mar 2022 13:13:59 +0100
In-Reply-To: <20220307141321.307200-1-dopsi@dopsi.ch> (Simon Doppler's message
 of "Mon, 7 Mar 2022 15:13:21 +0100")
Message-ID: <87ilscsrnc.fsf@dell.be.48ers.dk>
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

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
