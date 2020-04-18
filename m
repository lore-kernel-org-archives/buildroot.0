From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 18:18:18 +0200
Subject: [Buildroot] [PATCH v4] configs/nenopi_neo4: new updated
 defconfig
In-Reply-To: <1586891009-3147-1-git-send-email-marek.belisko@open-nandra.com>
References: <1586891009-3147-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <20200418181818.518d2882@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marek,

I've applied, with some very minor tweaks.

First, typo in the commit title nenopi -> nanopi

On Tue, 14 Apr 2020 21:03:29 +0200
Marek Belisko <marek.belisko@open-nandra.com> wrote:

> This patch revert 8af7b11bd8a95bc41e4de46f727f3b0afde465a4 and
> add extra options to have build working

I've improved the wording a bit, because this is not just about
reverting a previous patch.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 375ab07..dfcb7e4 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1605,6 +1605,8 @@ F:	package/libatasmart/
>  F:	package/polkit/
>  F:	package/sg3_utils/
>  F:	package/udisks/
> +F:	board/friendlyarm/nanopi-m4/
> +F:	configs/nanopi_neo4_defconfig

Alphabetic ordering was not good here.

So I fixed those minor details, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
