From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jul 2017 17:56:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/x265: disable altivec on ppc64
In-Reply-To: <20170723200339.12575-1-bernd.kuhls@t-online.de>
References: <20170723200339.12575-1-bernd.kuhls@t-online.de>
Message-ID: <20170724175646.55fd3cee@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Jul 2017 22:03:38 +0200, Bernd Kuhls wrote:
> Disable altivec support until gcc problems are fixed:
> https://bitbucket.org/multicoreware/x265/issues/320/fail-to-build-on-power8-le#comment-34076791
> 
> Fixes
> http://autobuild.buildroot.net/results/419/41910d44ff98c60a6bb9fd3b6a10bd4d0b98d646/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x265/x265.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
