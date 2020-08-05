From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 15:32:34 +0200
Subject: [Buildroot] [PATCHv3 4/5] package/enlightenment: bump to
 version 0.24.2
In-Reply-To: <20200801142035.4060526-4-romain.naour@gmail.com>
References: <20200801142035.4060526-1-romain.naour@gmail.com>
 <20200801142035.4060526-4-romain.naour@gmail.com>
Message-ID: <20200805153234.3d16f6e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Aug 2020 16:20:34 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
> index f692a67aa1..6f3f518891 100644
> --- a/package/enlightenment/enlightenment.hash
> +++ b/package/enlightenment/enlightenment.hash
> @@ -1,3 +1,4 @@
> -# From https://www.enlightenment.org/news/e23_release
> -sha256	b8c5d040875576d3d3ad8572644f92a65e21291bcee6b0d62f74fbfd482afdf8	enlightenment-0.23.0.tar.xz
> -sha256	34dbd501ec9d1c8dcc569c01db9cf9a4b7ee5981614cc9f8f613a97463d27350	COPYING
> +# From https://www.enlightenment.org/news/e24.2
> +sha256  be18e2f18d6c0b058f633e769863d3cbc4c07b629058ae670dec74cd7906dff1  enlightenment-0.24.2.tar.xz
> +sha256  17dda7902d3e1a743f91cf2545f474be93f612768a9e9022593d788ecc83935a  COPYING
> +sh&256  f4ba47ef8f4ff588202e721ab10f0208a3fa678147e7f928e6b2820f2e646e13  src/modules/wl_weekeyboard/themes/default/fonts/LICENSE.txt

   ^^^^ typo here (reported by "make check-package")

I fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
