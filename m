From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Dec 2016 18:34:36 +0100
Subject: [Buildroot] [PATCH 1/4] jpeg-turbo: now checks for pkg-config
In-Reply-To: <20161211155219.22814-1-peter@korsgaard.com>
References: <20161211155219.22814-1-peter@korsgaard.com>
Message-ID: <20161211183436.6726b2c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Dec 2016 16:52:16 +0100, Peter Korsgaard wrote:
> The jpeg-turbo configure script now contains PKG_PROG_PKG_CONFIG, even
> though it doesn't so far use pkg-config to detect any dependencies (it does
> install a .pc file now though):
> 
> checking pkg-config is at least version 0.9.0... ./configure: line 13540: \
>   /home/peko/source/buildroot/output/host/usr/bin/pkg-config: No such file or directory
> 
> Depend on host-pkgconf for consistency.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/jpeg-turbo/jpeg-turbo.mk | 1 +
>  1 file changed, 1 insertion(+)

All four patches applied, thanks. Notice that on PATCH 3/4, you had a
mix of tabs and spaces for the indentation of the PowerPC Altivec
dependency.

Also, since you are interested about jpeg-turbo, what about adding
yourself for this package in DEVELOPERS? We already have another
developer, but who isn't really active, so having someone else would be
good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
