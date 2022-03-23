Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282FAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 17:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D25E340C5F;
	Wed, 23 Mar 2022 17:02:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jA0sstXSSBXd; Wed, 23 Mar 2022 17:02:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDCF540121;
	Wed, 23 Mar 2022 17:02:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E406C1BF4DA
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 17:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0BE141B9B
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 17:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tPG5FJf6PXmD for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 17:02:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4B8141B96
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 17:02:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d34:bdfa:f457:8010])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9FA2019F4C8;
 Wed, 23 Mar 2022 18:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1648054957;
 bh=2tBUAbyGtB6SGfXVFDbhhb9TZYSByE2nc1hEN8Gyk5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eLfjQY9TjwClQIMDYS2ptZCsBEtR4QB5yXcL9vOibsSdio1VRKDjr2vkQrG7bFwqP
 alOigeI6fmJf5sZPSNoQLPF89FAgNdDxUwv5HVY+GwGSvAik0Ou/8QHDsxyG/tqskp
 7X6Dd6N042z/wZMHk+B+17NPfrkP4Hzr2SluCnnsstFEQriA4Q8/5D5vD/ZqMCRXXg
 nBOHwR6RG4w42yljraYKoDe7iCcNL3TRr1HqA/UUGBAq0c4MSA3JuWIX+188Euz+F5
 +V0v5WRrt7Mj/djZoqsC+Keg24m+TiWRCupRsYjLjYmAFQUHFzXSkse0oODYqdDRxT
 fhVxYUn2En4/g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 23 Mar 2022 18:02:35 +0100
Date: Wed, 23 Mar 2022 18:02:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20220323170235.GO1566358@scaer>
References: <20220323072029.260340-1-neal.frager@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220323072029.260340-1-neal.frager@amd.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 1/1] DEVELOPERS: update email address
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

Neal, All,

On 2022-03-23 01:20 -0600, Neal Frager via buildroot spake thusly:
> This patch updates my email address in the DEVELOPERS file.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 942bb8fe9c..58ed4f81cd 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2089,7 +2089,7 @@ F:	package/libevdev/
>  F:	package/pkg-qmake.mk
>  F:	package/qt5/qt5opcua/
>  
> -N:	Neal Frager <neal.frager@xilinx.com>
> +N:	Neal Frager <neal.frager@amd.com>
>  F:	board/zynqmp/
>  F:	configs/zynqmp_zcu102_defconfig
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
