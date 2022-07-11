Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB704C43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 584D460F30;
	Mon, 11 Jul 2022 17:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 584D460F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Op48v3P9sdA; Mon, 11 Jul 2022 17:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 628DF60ED7;
	Mon, 11 Jul 2022 17:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 628DF60ED7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6901BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08313409A3
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08313409A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUlBfrsHsGTG for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:21:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A77F40997
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A77F40997
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:21:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C704360002
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:21:30 +0000 (UTC)
Message-ID: <520875ac-12ae-e3a7-f1af-8e09e494eb55@korsgaard.com>
Date: Mon, 11 Jul 2022 19:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220610165541.2574405-1-francois.perrad@gadz.org>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220610165541.2574405-1-francois.perrad@gadz.org>
Subject: Re: [Buildroot] [PATCH] package/gnutls: bump to version 3.7.6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/06/2022 18.55, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Committed to 2022.02.x and 2022.05.x, thanks.

> ---
>   package/gnutls/gnutls.hash | 4 ++--
>   package/gnutls/gnutls.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
> index c09e4665e..ff191278c 100644
> --- a/package/gnutls/gnutls.hash
> +++ b/package/gnutls/gnutls.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.4.tar.xz.sig
> -sha256  e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f6217451f  gnutls-3.7.4.tar.xz
> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.6.tar.xz.sig
> +sha256  77065719a345bfb18faa250134be4c53bef70c1bd61f6c0c23ceb8b44f0262ff  gnutls-3.7.6.tar.xz
>   # Locally calculated
>   sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
>   sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index f7f3e046e..f1af1e7b3 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -6,7 +6,7 @@
>   
>   # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
>   GNUTLS_VERSION_MAJOR = 3.7
> -GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).4
> +GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).6
>   GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>   GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
>   GNUTLS_LICENSE = LGPL-2.1+ (core library)


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
