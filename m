Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E00DEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 07:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F4441043;
	Mon, 26 Jun 2023 07:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02F4441043
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIxO0-JGPF1B; Mon, 26 Jun 2023 07:04:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 315ED41087;
	Mon, 26 Jun 2023 07:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 315ED41087
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9CAE1BF3BC
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 07:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83BAE815CA
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 07:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83BAE815CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49tG2fXdvDAN for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 07:04:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C0B281766
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C0B281766
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 07:04:09 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98DD460003;
 Mon, 26 Jun 2023 07:04:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qDgGb-008GrO-MT; Mon, 26 Jun 2023 09:04:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20230625194428.43A3B851E8@busybox.osuosl.org>
Date: Mon, 26 Jun 2023 09:04:05 +0200
In-Reply-To: <20230625194428.43A3B851E8@busybox.osuosl.org> (Arnout
 Vandecappelle via buildroot's message of "Sun, 25 Jun 2023 21:42:57
 +0200")
Message-ID: <87edlyogbe.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libcgroup: add newline at end
 of file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=fd6b33426962727b97e2ea2a63bfb7a018adcfaf
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > In commit 9d58b525fcfd0d92fcdd3c66d7858213c4b139c6 the newline at the
 > end got accidentally removed. Re-add it.

 > Reported by check-package.

 > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
 > ---
 >  package/libcgroup/Config.in | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
 > index 546b5f3560..9326b967ed 100644
 > --- a/package/libcgroup/Config.in
 > +++ b/package/libcgroup/Config.in
 > @@ -18,4 +18,5 @@ config BR2_PACKAGE_LIBCGROUP_TOOLS
 >  endif
 
 >  comment "libcgroup needs a toolchain w/ C++"
 > -	depends on !BR2_INSTALL_LIBSTDCPP
 > \ No newline at end of file
 > +	depends on !BR2_INSTALL_LIBSTDCPP
 > +

You accidently added 2 newlines, causing checkpackage to complain about
that. Fixed in git now.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
