Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A3EC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED11E40590;
	Sat, 22 Jan 2022 20:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4nNeu8m1wVa0; Sat, 22 Jan 2022 20:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D11654059C;
	Sat, 22 Jan 2022 20:03:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 25D471BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 20:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DD664059C
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 20:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zcREOdMZEggy for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 20:03:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6DBE40590
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 20:03:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1CA80B004E8;
 Sat, 22 Jan 2022 21:03:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642881824;
 bh=oWWju9aoSuWHvkFQrSyh7cmI9moxpq+le/QzG/KUGi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B428BkYY5qIkhX1Nrwz2ccAPzKcgX0P0u+3zYzOGGJR9qeOhggyTxYD90oIZWrxUA
 OHfuYOehbd0aVwywl/ASAxgzfK1cAVS7s5ea0vGgkGhPzFryi4+RVAUwZOSvpuYOVT
 adB90HYtlYo2pGDft5kwrSegPpBdEBCBpSQbrsk+PbR68F4s4o9KM3i2ECFz+Kcswf
 TPjUVOgB/FJuairzLjv5+J3i4gtfOfzzRcmb5YPjiPVfROi+qGAVYJb2wzdGP+PARq
 MbtQGKquibeoY5sTnk4kEdDCRZqLp1IDNdESaRuSy5C/T94Mq4h9UdDROrML4RU49q
 XWxJGXuWNQ6yg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 21:03:41 +0100
Date: Sat, 22 Jan 2022 21:03:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sergey Bobrenok <bobrofon@gmail.com>
Message-ID: <20220122200341.GG3621364@scaer>
References: <20220122124111.103131-1-bobrofon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122124111.103131-1-bobrofon@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/sdbus-cpp: bump to version 1.1.0
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

Sergey, All,

On 2022-01-22 15:41 +0300, Sergey Bobrenok spake thusly:
> Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
> ---
>  package/sdbus-cpp/sdbus-cpp.hash | 3 ++-
>  package/sdbus-cpp/sdbus-cpp.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
> index 8b87653dfd..3a0e863a86 100644
> --- a/package/sdbus-cpp/sdbus-cpp.hash
> +++ b/package/sdbus-cpp/sdbus-cpp.hash
> @@ -1,3 +1,4 @@
>  # Locally computed:
> -sha256  0fd575ae0f463773dd9141242d1133731e2b780fd6526650ce992ba711d88628  v0.8.3.tar.gz
> +sha256  35e939fdd9c796522702c9c8762dd59b5c47f3440c01ba9feb9921c042780b55  v1.1.0.tar.gz
>  sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
> +sha256  be43debbf06a38325616054a39e44ed5afde4ed21b99de197488a4a306d47e39  COPYING-LGPL-Exception
> diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
> index 24904ee26f..e0fbc5c856 100644
> --- a/package/sdbus-cpp/sdbus-cpp.mk
> +++ b/package/sdbus-cpp/sdbus-cpp.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -SDBUS_CPP_VERSION = 0.8.3
> +SDBUS_CPP_VERSION = 1.1.0
>  SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
>  SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
>  SDBUS_CPP_INSTALL_STAGING = YES
>  SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
> -SDBUS_CPP_LICENSE = LGPL-2.1+
> -SDBUS_CPP_LICENSE_FILES = COPYING
> +SDBUS_CPP_LICENSE = LGPL-2.1+ with exception (headers)
> +SDBUS_CPP_LICENSE_FILES = COPYING COPYING-LGPL-Exception

Thanks for noticing the update in the licensing terms. :-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  $(eval $(cmake-package))
> -- 
> 2.31.1
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
