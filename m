From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 23:39:58 +0200
Subject: [Buildroot] [PATCH/next 1/4] package/botan: bump version to
 2.7.0
In-Reply-To: <20180818233052.30190-1-bernd.kuhls@t-online.de>
References: <20180818233052.30190-1-bernd.kuhls@t-online.de>
Message-ID: <20180820233958.62e2f505@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 01:30:49 +0200, Bernd Kuhls wrote:
> Depends on gcc >= 4.8:
> https://github.com/randombit/botan/blob/master/readme.rst
> 
> Rebased patch 0001, added license hash and updated license path.
> 
> Updated configure options for shared/static libraries after commit
> https://github.com/randombit/botan/commit/299119f02c09e7d3e657b13e1706cb653eff560c
> 
> Added configure for ssp support after commit
> https://github.com/randombit/botan/commit/ebeae68aba0d3384a00fddde77a561bb0cd88102
> This fixes a build error with toolchains without ssp support.
> 
> Removed dependency to gmp:
> https://github.com/randombit/botan/issues/719
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-remove-mips64-explicit-mabi.patch    | 10 ++++---
>  package/botan/Config.in                       |  6 ++--
>  package/botan/botan.hash                      |  4 ++-
>  package/botan/botan.mk                        | 30 +++++++++++++------
>  4 files changed, 34 insertions(+), 16 deletions(-)

First of all, thanks for your documented commit log. It is definitely
nice to have all those details to understand the changes made as part
of the version bump. So thanks for doing that.

I've applied the entire series to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
