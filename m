Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E5FC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 10:25:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C49B560FE6
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 10:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C49B560FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B8F940132;
	Wed, 18 Aug 2021 10:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ladZJxWrvHeD; Wed, 18 Aug 2021 10:25:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2C5440186;
	Wed, 18 Aug 2021 10:25:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A76531BF86B
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 10:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2F4540186
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 10:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g1XveyrLp-Zs for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 10:25:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB40140132
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 10:25:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 27B64E0003
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 10:25:12 +0000 (UTC)
Date: Wed, 18 Aug 2021 12:25:11 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Message-ID: <20210818122511.005d6a5c@windsurf>
In-Reply-To: <20210818065730.330904074D@smtp4.osuosl.org>
References: <20210818065730.330904074D@smtp4.osuosl.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Wed, 18 Aug 2021 06:57:22 -0000
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Detail of failures for next
> ---------------------------
> 
>     arch     |             reason             | OK? |                                       url                                       | orph?
> -------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------

[...]

>    sparc     |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/c5013a4d9a7dd2305bab8d9aa43104fd5f353bcf |     
>     arc      |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/2511a7ec0b4fc29133a4fc99160beb47c5681f02 |     
>   powerpc    |        host-libcap-2.52        | NOK | http://autobuild.buildroot.net/results/e0d8cb350072ea90c331824a6790c792d60d885d |     

I am confused by these host-libcap issues, as I'm not able to
reproduce. I tried on my local machine, and the host binaries have the
proper RPATH. Thinking it might be a machine/distro specific issue, I
tried on the gcc160 machine, which has reported build issues, and I
tried building the exact defconfig of one of the build failures, and
host-libcap builds just fine.

So, I'm confused :/ Any idea ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
