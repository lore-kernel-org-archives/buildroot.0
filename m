Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7BCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A340960E95;
	Sun, 13 Mar 2022 09:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmZzb8bzBqLU; Sun, 13 Mar 2022 09:09:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 933FB60E8F;
	Sun, 13 Mar 2022 09:09:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44FA91BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:09:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F55D60E8F
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pbUdwT9Ob_-J for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:09:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59214606E6
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:09:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91a3:d0c0:1a06:f60f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9045D780374;
 Sun, 13 Mar 2022 10:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647162585;
 bh=w/PxjAcXvUAMk2j1XiZiuuXhmfKt0SYBnrXlOOKgyes=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m5f8iAnfWvQ4b2wu73j3SksPsN15P9EXvDsd57PjEPoOrbHkYdCOvZ1H4ratn0xjm
 iF6csFKaaTZaB4xMMPkoZmuuFJMAkJxk2ZNjczpiRFmmbr746MaspZnC5eWqN0eqBF
 kRMYyEwMTO2g1gwd5wJ8ZzOTT03sYgfbouokxoJsjAE4/7l42SlZJbUU3JQAB9tybC
 vkLgl+V12d6ys5oKL9WASbVr9SNOUI9exs0Q6CoDZ3o6kHnGCvLweBH7InXmgBF2WA
 45QRFyg302IGl7MCGCtTgM7xy6KJUbQLfrIy1frlHMKZtc7uJyxhNa81/syfLcruXj
 eKmAa1y7ViEmw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Mar 2022 10:09:42 +0100
Date: Sun, 13 Mar 2022 10:09:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220313090942.GR283544@scaer>
References: <20220311191717.3878852-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220311191717.3878852-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to
 version 54.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kames, All,

On 2022-03-11 12:17 -0700, James Hilliard spake thusly:
> Migrate from distutils to flit package infrastructure.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

But see below, please...

[--SNIP--]
> diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
> index 0a944825bb..925de855bc 100644
> --- a/package/python-weasyprint/python-weasyprint.mk
> +++ b/package/python-weasyprint/python-weasyprint.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_WEASYPRINT_VERSION = 53.4
> +PYTHON_WEASYPRINT_VERSION = 54.2
>  PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
> -PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/72/25/336e274fde0e48cf9979d44667411fbcfa55d323fd7672068807b6de2f89
> -PYTHON_WEASYPRINT_SETUP_TYPE = distutils
> +PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/f3/dc/d3d6f1d87a0a0b09637a1f5076790e229cc803c3584ed4edb76553844001
> +PYTHON_WEASYPRINT_SETUP_TYPE = flit

'flit', as well as 'pep5127', are not documented in the manual:
    https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_python_packages

Can you please send updates to fix that, now? ;-)

Regards,
Yann E. MORIN.

>  PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
>  PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
>  
> -- 
> 2.25.1
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
