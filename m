From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 14 Aug 2016 13:41:47 +0300
Subject: [Buildroot] [PATCH 1/8] package/netbsd-compat-headers: provide
 compatibility headers not in musl
In-Reply-To: <1d561e7440fd9f14063d006fc3dca596c9c849c7.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <1d561e7440fd9f14063d006fc3dca596c9c849c7.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <20160814104147.GA3368@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Aug 12, 2016 at 10:49:54PM +0200, Yann E. MORIN wrote: 
> diff --git a/package/musl-compat-headers/cdefs.h b/package/musl-compat-headers/cdefs.h
> new file mode 100644
> index 0000000..0a78b8f
> --- /dev/null
> +++ b/package/musl-compat-headers/cdefs.h
> @@ -0,0 +1,40 @@
> +/* Copyright (C) 2016 Yann E. MORI <yann.morin.1998@free.fr>

Your last name is missing 'N'.

> + *
> + * This file is in the Public Domain.
> + *
> + * For jurisdictions in which the Public Domain does not exist
> + * or it is not otherwise applicable, this file is licensed CC0
> + * (Creative Commons Zero).
> + */

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
