Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B93C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 21:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1967A82CFD;
	Sun, 29 May 2022 21:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDpOLVcesfwc; Sun, 29 May 2022 21:41:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EA8882CDE;
	Sun, 29 May 2022 21:41:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBCA51BF336
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C924882CD4
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 21:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8B7vnfwuDYFv for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 21:41:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98F66826B0
 for <buildroot@buildroot.org>; Sun, 29 May 2022 21:41:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 07203780333;
 Sun, 29 May 2022 23:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653860493;
 bh=ZgriuntDbKffJ1QyrkUTTbc41HG5TmBKZTkpNbSOf8A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MprhceD9f4Ezml7gLAy3zqk0HtCYWgyxu3QscdM8mUu1M9wRwprWURMxHXMabzFC4
 V5L1l7h8kixKuKUV4IupocvX8v3yiYTRlUoArIUuOSoVQ20xAjyCMhmgqk9KEm04V2
 ZsQvKJOZ/pWxpypCIrOHJtWD3pgfyR2sKSRiaZjauzHLcoVHDkPMHPCuLpO8XHX2GR
 m2Orvkl+Hxh1ApkWouAKXStGEn2ZtOAx3aJJZtjbTOSSrKLSMHFnfuNSuqBygBYH1g
 ScoN+jbIF3xl/t9bIc77y8dYPHSlyVM6JNkTP/OoMDTyZADGa4fO+rherjE6r2wg63
 pw7eaBrFCrhmw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 23:41:29 +0200
Date: Sun, 29 May 2022 23:41:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220529214129.GL993669@scaer>
References: <20220517201249.1518358-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220517201249.1518358-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-werkzeug: bump to
 version 2.1.2
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

James, All,

On 2022-05-17 14:12 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Since this version bump fixes a runtime test, I applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-werkzeug/python-werkzeug.hash | 6 +++---
>  package/python-werkzeug/python-werkzeug.mk   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
> index 1d6de8a0c7..73fa6b5630 100644
> --- a/package/python-werkzeug/python-werkzeug.hash
> +++ b/package/python-werkzeug/python-werkzeug.hash
> @@ -1,5 +1,5 @@
> -# md5, sha256 from https://pypi.org/pypi/werkzeug/json
> -md5  5d499cfdd30de5d9c946994783772efd  Werkzeug-1.0.1.tar.gz
> -sha256  6c80b1e5ad3665290ea39320b91e1be1e0d5f60652b964a3070216de83d2e47c  Werkzeug-1.0.1.tar.gz
> +# md5, sha256 from https://pypi.org/pypi/Werkzeug/json
> +md5  5835c8738b8081c53367cbcc5db8784c  Werkzeug-2.1.2.tar.gz
> +sha256  1ce08e8093ed67d638d63879fd1ba3735817f7a80de3674d293f5984f25fb6e6  Werkzeug-2.1.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
> diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
> index fe9b87af1d..9b32fdf097 100644
> --- a/package/python-werkzeug/python-werkzeug.mk
> +++ b/package/python-werkzeug/python-werkzeug.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_WERKZEUG_VERSION = 1.0.1
> +PYTHON_WERKZEUG_VERSION = 2.1.2
>  PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
> -PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/27/a33329150147594eff0ea4c33c2036c0eadd933141055be0ff911f7f8d04
> +PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/10/cf/97eb1a3847c01ae53e8376bc21145555ac95279523a935963dc8ff96c50b
>  PYTHON_WERKZEUG_SETUP_TYPE = setuptools
>  PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
>  PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
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
