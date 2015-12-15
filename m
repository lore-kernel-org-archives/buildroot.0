From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:34:04 +0100
Subject: [Buildroot] [PATCH] gptfdisk: Add host package
In-Reply-To: <1449617254.26955.31.camel@rtred1test09.kymeta.local>
References: <1449617254.26955.31.camel@rtred1test09.kymeta.local>
Message-ID: <20151215223404.2f4ca360@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Trent Piepho,

On Tue, 8 Dec 2015 23:27:28 +0000, Trent Piepho wrote:
> This tool is useful for scripts that create flash images with
> multiple partitions.  The host-parted package can do this too, but is
> missing a number of features that the gptfdisk program has for dealing
> with GPT.
> 
> The interactive gdisk and curses based sgdisk aren't built.  Just the
> scriptable tool sgdisk.  The target package allows configuring which
> tools are built, but this seem unnecessarily complex for the host
> package.
> 
> Signed-off-by: Trent Piepho <tpiepho@kymetacorp.com>
> ---
>  package/Config.in.host          |  1 +
>  package/gptfdisk/Config.in.host |  9 +++++++++
>  package/gptfdisk/gptfdisk.mk    | 11 +++++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 package/gptfdisk/Config.in.host

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
