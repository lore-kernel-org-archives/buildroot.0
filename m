From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 21:51:33 +0200
Subject: [Buildroot] [PATCH] musl: bump to 1.1.20
In-Reply-To: <20180908204233.21208-1-thomas.petazzoni@bootlin.com>
References: <20180908204233.21208-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180910215133.39c67a36@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  8 Sep 2018 22:42:33 +0200, Thomas Petazzoni wrote:
> From the upstream release announcement:
> 
> """
> This release introduces the ability to replace/interpose the allocator
> (malloc) subject to certain restrictions, adds an experimental m68k
> port, and makes notable improvements to stdio (application-provided
> buffers), getaddrinfo (AI_ADDRCONFIG, support for IPv4-only kernel
> configurations), the dynamic linker (safety against dlopen of
> libraries using initial-exec TLS model, reclaiming unused memory on
> FDPIC archs, better dladdr results), and handling of default thread
> stack size (pthread_setattr_default_np now works more reliably).
> 
> Many bugs have been fixed, including potentially dangerous regressions
> in iconv (only for new conversions to legacy encodings) and visibly
> incorrect behavior in printf on non-x86 archs (%a format with
> precision specifier), in getopt_long_only when short options are a
> prefix for a long option, in complex arc-trig/hyperbolic functions, in
> strftime and mktime (timezone-specific issues), and numerous
> less-obvious places.
> """
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/musl/musl.hash | 4 ++--
>  package/musl/musl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
