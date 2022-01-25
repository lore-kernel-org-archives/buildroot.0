Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209C9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 18:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDC0A410DE;
	Tue, 25 Jan 2022 18:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RxLCAV-k_1dC; Tue, 25 Jan 2022 18:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03139414C1;
	Tue, 25 Jan 2022 18:19:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD7C1BF301
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C5AB4033D
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 18:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3kNZG921hGk for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 18:19:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBB9C40336
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 18:19:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:40e2:478e:9a26:9cef])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 08E4A5FFA9;
 Tue, 25 Jan 2022 19:19:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643134764;
 bh=2VNrERLqv9CxzJXMDFrDfb3HmSoyXoicf+zOOOEPp8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J6LWau7eiRYrRTWrsVDRleDSnH5x8veRuMeyJELWBS6PsmCdxOLIosItSPqswS/IO
 veS79kwXpWMlpRhXRQLPpUzH49PgOkbrl/CAV9OOClV/d4px1kVSfl4VUZkZIzyhQ6
 xbRh9/R8vUQp2bEB1fF3ZylhSS8mqmaRFNZkKjm6Vndfzgx8P8SvdPVdeKNRuGLSNF
 4VIZMTNHq8+G0Xlz6jQbBPWWiSYYhKST0dPVvLAHMBGylg2Gq1QdXTY+1LUMEDwnu9
 VGBVK3eq36Em2xJrWk0Tkx4RFzb4X2vOyaRIYQpmEzl18qt94X9PiyuqRnp85+yNuo
 j56jBI1g93XLg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 19:19:21 +0100
Date: Tue, 25 Jan 2022 19:19:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Uladzimir Bely <wiselord1983@gmail.com>
Message-ID: <20220125181921.GC457876@scaer>
References: <20220124080352.2116-1-wiselord1983@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124080352.2116-1-wiselord1983@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/python-mpd2: bump to version 3.0.5
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

Uladzimir, All,

On 2022-01-24 11:03 +0300, Uladzimir Bely spake thusly:
> Signed-off-by: Uladzimir Bely <wiselord1983@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-mpd2/python-mpd2.hash | 4 ++--
>  package/python-mpd2/python-mpd2.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-mpd2/python-mpd2.hash b/package/python-mpd2/python-mpd2.hash
> index 83487257ee..88dcb28377 100644
> --- a/package/python-mpd2/python-mpd2.hash
> +++ b/package/python-mpd2/python-mpd2.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/python-mpd2/json
> -md5  e31c6063e9c2e029a26b0815cd08b05e  python-mpd2-3.0.4.tar.gz
> -sha256  7a67834e22d97e7cd77f8951c8baf87c149285c67d67d73550ce034302561ae5  python-mpd2-3.0.4.tar.gz
> +md5  594dff3e53c8eb6f583ba642bc2c1a27  python-mpd2-3.0.5.tar.gz
> +sha256  6f1bffd93b9a32fc018a9bbf3487505b52e0d757ec34066905c60a912d492384  python-mpd2-3.0.5.tar.gz
>  # Locally computed sha256 checksums
>  sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  LICENSE.txt
> diff --git a/package/python-mpd2/python-mpd2.mk b/package/python-mpd2/python-mpd2.mk
> index f357e302fd..bfe382b59e 100644
> --- a/package/python-mpd2/python-mpd2.mk
> +++ b/package/python-mpd2/python-mpd2.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PYTHON_MPD2_VERSION = 3.0.4
> -PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ad/92/bec26455a3a6d6146bcf2a974f5c3509d451306413b386fc12b037d9e3b0
> +PYTHON_MPD2_VERSION = 3.0.5
> +PYTHON_MPD2_SITE = https://files.pythonhosted.org/packages/ed/c2/263621bdbbc37fa1a55fa1a7f66fd601bf08b3f87481e318a3509fb6c4bf
>  PYTHON_MPD2_SETUP_TYPE = setuptools
>  PYTHON_MPD2_LICENSE = LGPL-3.0+
>  PYTHON_MPD2_LICENSE_FILES = LICENSE.txt
> -- 
> 2.34.1
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
