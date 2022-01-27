Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B77EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 09:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E2C684E14;
	Thu, 27 Jan 2022 09:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2-0LYKFSvow8; Thu, 27 Jan 2022 09:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF53A84DFC;
	Thu, 27 Jan 2022 09:50:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD1D81BF3F2
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 09:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBE2560F4B
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 09:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Liptu8EXjx7r for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 09:50:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E46AC60F3D
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 09:50:23 +0000 (UTC)
Date: Thu, 27 Jan 2022 09:50:12 +0000
From: Paul Cercueil <paul@crapouillou.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-Id: <ON4D6R.ED7V0SFOL2AA@crapouillou.net>
In-Reply-To: <20220126210039.1535791-1-fontaine.fabrice@gmail.com>
References: <20220126210039.1535791-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/umtprd: bump to version 1.6.2
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Le mer., janv. 26 2022 at 22:00:39 +0100, Fabrice Fontaine =

<fontaine.fabrice@gmail.com> a =E9crit :
> Update indentation in hash file (two spaces)
> =

> https://github.com/viveris/uMTP-Responder/blob/umtprd-1.6.2/Release-notes=
.txt
> =

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks! It's been on my to-do list for too long.

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  package/umtprd/umtprd.hash | 4 ++--
>  package/umtprd/umtprd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/package/umtprd/umtprd.hash b/package/umtprd/umtprd.hash
> index 170837d84b..7cd75619ab 100644
> --- a/package/umtprd/umtprd.hash
> +++ b/package/umtprd/umtprd.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256	cce45c7d3df0022fc013c79de21b1f11b1027d090aeb628669f08b0c20d2afdd	=
umtprd-1.3.10.tar.gz
> -sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	=
LICENSE
> +sha256  =

> 1de40511c1dd4618719cff2058dfe68a595f1b9284c80afa89d6d1a1c80aec29  =

> umtprd-1.6.2.tar.gz
> +sha256  =

> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  =

> LICENSE
> diff --git a/package/umtprd/umtprd.mk b/package/umtprd/umtprd.mk
> index f1a4e66cff..c5e0ee512e 100644
> --- a/package/umtprd/umtprd.mk
> +++ b/package/umtprd/umtprd.mk
> @@ -4,7 +4,7 @@
>  #
>  =

> #########################################################################=
#######
> =

> -UMTPRD_VERSION =3D 1.3.10
> +UMTPRD_VERSION =3D 1.6.2
>  UMTPRD_SITE =3D https://github.com/viveris/uMTP-Responder/archive
>  UMTPRD_LICENSE =3D GPL-3.0+
>  UMTPRD_LICENSE_FILES =3D LICENSE
> --
> 2.34.1
> =



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
