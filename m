Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ECDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEFE641F44;
	Sun, 12 Dec 2021 15:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZcWEH-Upy9K; Sun, 12 Dec 2021 15:08:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A45E41F42;
	Sun, 12 Dec 2021 15:08:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E4D601BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D379884FFF
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WRQtrzwFntI for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:08:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 05FE284FDB
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:08:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ccde:e15f:6f40:89e5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0653720039F;
 Sun, 12 Dec 2021 16:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639321727;
 bh=AHno/RSpjadfMPGvBcGG8/yqZF0TDlH5X1XaqFLcN+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iL1GA8OEDJuYJAsPBv8MaUxxI4H+pFh8BHxGgkPGxcBC/Mx4Ez9CfbDeDp3/oiBx8
 H2MCrJD8/AMDfKXwqPbvVJlB9MKIC8J24kyg09F5Hvp+NeYbjyHeeGp84c7QLMDKrr
 ozAKIh+gXIKfTMIGi+6RDC7mdlWT7xb6+3WKD4uLf1VcULFxwLE/H1T+8LinnjdSmE
 I4zPF1XkTkIXVBA2BJYEZFX5QZx09L/DOsPKudPmQAuWuG4p8nyt/0LBUEzEkn3GeT
 2x0K8MwcgBalCO7LWjkA1lAnuw0yFVHSQONwKHGMbYLWgoCvKU4tlYSficON4LS34u
 8kSiZfaVniKfA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Dec 2021 16:08:40 +0100
Date: Sun, 12 Dec 2021 16:08:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dariobin@libero.it>
Message-ID: <20211212150840.GR2603@scaer>
References: <20211212120953.6921-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211212120953.6921-1-dariobin@libero.it>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/davinci-bootcount: add myself
 to DEVELOPERS
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2021-12-12 13:09 +0100, Dario Binacchi via buildroot spake thusly:
> Add myself to DEVELOPERS as maintainer of davinci-bootcount.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 3023526427..adfd1b76fe 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -631,6 +631,9 @@ F:	package/lua-cjson/
>  F:	package/luaexpat/
>  F:	package/xinetd/
>  
> +N:	Dario Binacchi <dariobin@libero.it>
> +F:	package/davinci-bootcount/
> +
>  N:	David Bachelart <david.bachelart@bbright.com>
>  F:	package/ccrypt/
>  F:	package/dos2unix/
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
