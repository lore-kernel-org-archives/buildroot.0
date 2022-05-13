Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DC0C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 09:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA2C40862;
	Fri, 13 May 2022 09:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ms6sR3PiGHZK; Fri, 13 May 2022 09:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AADE4035E;
	Fri, 13 May 2022 09:10:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 493921BF2E5
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 09:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46B3B4035E
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 09:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4h3ju3DZ2mEd for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 09:10:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B498E4029A
 for <buildroot@buildroot.org>; Fri, 13 May 2022 09:10:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CD5CFFF802;
 Fri, 13 May 2022 09:10:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1npRJg-009JFq-Rt; Fri, 13 May 2022 11:10:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220512185355.873825-1-bernd.kuhls@t-online.de>
 <20220512185355.873825-17-bernd.kuhls@t-online.de>
 <20220512194821.GB1597494@scaer>
Date: Fri, 13 May 2022 11:10:32 +0200
In-Reply-To: <20220512194821.GB1597494@scaer> (Yann E. MORIN's message of
 "Thu, 12 May 2022 21:48:21 +0200")
Message-ID: <87pmkh94s7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 17/25] package/x11r7/xapp_xsm: bump version
 to 1.0.5
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Bernd, All,
 > +Arnout +Peter +Luca

 > On 2022-05-12 20:53 +0200, Bernd Kuhls spake thusly:
 >> Release notes:
 >> https://lists.x.org/archives/xorg-announce/2022-April/003152.html
 >> 
 >> Updated license hash due to upstream commit:
 >> https://gitlab.freedesktop.org/xorg/app/xsm/-/commit/e552f2d4980d41d7a219dbe0c5dbaf33c4d752f3

 > I was a bit surprised that the new licensing terms are not really those
 > of the MIT license, so I checked, and that's what SPDX knows as the MIT
 > license:
 >     https://spdx.org/licenses/MIT.html

 > However, the license for the xsm is not exactly those terms, but is
 > known by SPDX as MIT-open-group (MIT Open Group variant):
 >     https://spdx.org/licenses/MIT-open-group.html

 > So I had a quick look at a few other xapps, and they all use that same
 > license.

 > Wikipedia still lists it as MIT:
 >     https://en.wikipedia.org/wiki/X.Org_Server

 > And the Xorg website also insists it is MIT:
 >     https://www.x.org/wiki/

 > So, I am not sure. I would tend to think we should switch listing them
 > as MIT-open-group.

 > Thoughts?

It is a bit pedantic as there's no real functional difference, but yeah
- Would be more correct.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
