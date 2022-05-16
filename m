Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0441AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A52C54182D;
	Mon, 16 May 2022 21:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uoPBgZwuYML9; Mon, 16 May 2022 21:39:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9EEE41821;
	Mon, 16 May 2022 21:39:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 824B41BF35A
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 706FE60EF8
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENFERso6YVMw for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:39:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 948C060EB2
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:39:24 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5536:e9db:e000:2fa9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A487EB0054C;
 Mon, 16 May 2022 23:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652737161;
 bh=rvHtH4FHCAdtNfzgjjZzLk/sn8Vyh8xWyaZM/qttAdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a7T7sZKvbwK5oN5q0Io/+6LSEdcfBnWDZcmfKoP2lpjFYbzeNxYZh+iCkv1nITrWj
 +vnKDmwhFkhKJB2dEcOTuzbkj+9HEbAcX+W5cQkLjkim4krmEQyDcDTg3XOp0HBx72
 oS6rf5aV14KQQqGS2ielUxz6xhNVLajxhwlPHNuucgSNuuiJcX4mDhYx3ziw/g3cfL
 +L4VwZEgWW8d5mcDnZuZKaINz6+BDV2l2Ps1bw4yXfnepsX0JtlpLkt8WQrP4uYas+
 WuR21jRzo6AkTR/7rztT4vbJT0dhtPT3A9k14N/gMoI6xpqBnhNGgMuqJZA0lU5H0r
 o5H5rejHs/U6g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 May 2022 23:39:19 +0200
Date: Mon, 16 May 2022 23:39:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220516213919.GK1597494@scaer>
References: <20220516184035.187445-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516184035.187445-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Gerome Burlats,
 e-mail is bouncing
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

Romain, All,

On 2022-05-16 20:40 +0200, Romain Naour spake thusly:
> Gerome Burlats left Smile in May 2022 and his e-mail has been disabled.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8988688beb..c33959fa45 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1071,10 +1071,6 @@ F:	package/flannel/
>  N:	Geoffrey Ragot <geoffreyragot@gmail.com>
>  F:	package/python-pyyaml/
>  
> -N:	Gerome Burlats <gerome.burlats@smile.fr>
> -F:	board/qemu/
> -F:	configs/qemu_*
> -
>  N:	Gilles Talis <gilles.talis@gmail.com>
>  F:	board/freescale/imx8mmevk/
>  F:	board/friendlyarm/nanopi-r2s/
> -- 
> 2.35.3
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
