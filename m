From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 25 Dec 2017 16:59:13 +0100
Subject: [Buildroot] [PATCH 3/3] package/piglit: new package
In-Reply-To: <20171225154923.18773-3-romain.naour@gmail.com>
References: <20171225154923.18773-1-romain.naour@gmail.com>
 <20171225154923.18773-3-romain.naour@gmail.com>
Message-ID: <adf561ff-3482-7071-903f-22fbdcce4510@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 25/12/2017 ? 16:49, Romain Naour a ?crit?:
> Piglit is an open-source test suite for OpenGL implementations.
> It's an python3 script based around several tools like glxinfo,
> wflinfo, dmesg.
> 
> Even though waffle support can be replaced by freeglut,
> using pliglit with waffle is recommended since freeglut
> will be replaced by waffle.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Bernd, I'm Cc you since you're probably interested by piglit to
> test new mesa3d version.
> ---

[...]

> --- /dev/null
> +++ b/package/piglit/piglit.hash
> @@ -0,0 +1,6 @@
> +# Locally calculated
> +sha256 e26070ab10bbe4583543d076a495731888e3be9933e4907a62f25b102ad65023  dl/piglit-75ba8aea0e6eff0bc30821df9640ee4053dd98b6.tar.gz
								           ^^^^
Sorry, my usual copy past error while generating a hash from the download
directory...

Please remove before testing.

Best regards,
Romain

> +sha256 dcc398730859aee7cc1d6aa57f526f8d181b47bb3a49830e85b5723d5bc2c3bc  COPYING
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licences/GPL-2
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  licences/GPL-3
> +sha256 b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  licences/LGPL-2
