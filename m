From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:51:27 +0200
Subject: [Buildroot] [PATCH 1/2] package/jsoncpp: switch build system to
 meson
In-Reply-To: <20190904210238.7585-1-bernd.kuhls@t-online.de>
References: <20190904210238.7585-1-bernd.kuhls@t-online.de>
Message-ID: <20190915225127.092c2588@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  4 Sep 2019 23:02:37 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Bumping jsoncpp to 1.9.1 will cause a CMake-related build error:
> https://github.com/open-source-parsers/jsoncpp/issues/970
> 
> To fix the bug upstream suggests to switch to meson:
> "Our official policy has been only supporting the meson build, and
>  having users submit fixes for the CMake build."
> https://github.com/open-source-parsers/jsoncpp/issues/970#issuecomment-509794015
> 
> Remove all _CONF_OPTS as they are not supported by meson.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Build-tested using this defconfig:

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
