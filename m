Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171F1C47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 09:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A22F8813D9;
	Sun,  7 Jan 2024 09:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A22F8813D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V8TTRVEM_1IB; Sun,  7 Jan 2024 09:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F55F813D1;
	Sun,  7 Jan 2024 09:19:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F55F813D1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D866F1BF831
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 09:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1660813CC
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 09:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1660813CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BVABB6w97zGO for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 09:19:13 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D92A4813B2
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 09:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D92A4813B2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F20D1C0002
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 09:19:09 +0000 (UTC)
Message-ID: <63161377-6c2e-4dcd-a471-9d9445b2feb5@korsgaard.com>
Date: Sun, 7 Jan 2024 10:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231204211447.12629-1-bernd@kuhls.net>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20231204211447.12629-1-bernd@kuhls.net>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: bump version to 3.8.2
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

On 04/12/2023 22.14, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed to 2023.11.x, thanks.

> ---
>   package/gnutls/gnutls.hash | 4 ++--
>   package/gnutls/gnutls.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
> index a6ba6b22c6..6ad363f01d 100644
> --- a/package/gnutls/gnutls.hash
> +++ b/package/gnutls/gnutls.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.1.tar.xz.sig
> -sha256  ba8b9e15ae20aba88f44661978f5b5863494316fe7e722ede9d069fe6294829c  gnutls-3.8.1.tar.xz
> +# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.8/gnutls-3.8.2.tar.xz.sig
> +sha256  e765e5016ffa9b9dd243e363a0460d577074444ee2491267db2e96c9c2adef77  gnutls-3.8.2.tar.xz
>   # Locally calculated
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  doc/COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  doc/COPYING.LESSER
> diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
> index d9b9831fd6..3e9987cdce 100644
> --- a/package/gnutls/gnutls.mk
> +++ b/package/gnutls/gnutls.mk
> @@ -6,7 +6,7 @@
>   
>   # When bumping, make sure *all* --without-libfoo-prefix options are in GNUTLS_CONF_OPTS
>   GNUTLS_VERSION_MAJOR = 3.8
> -GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).1
> +GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).2
>   GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
>   GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
>   GNUTLS_LICENSE = LGPL-2.1+ (core library)

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
