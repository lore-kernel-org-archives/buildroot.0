From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 May 2013 13:06:54 +0200
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
In-Reply-To: <20130507210347.EA3EB99CCB@busybox.osuosl.org>
References: <20130507210347.EA3EB99CCB@busybox.osuosl.org>
Message-ID: <20130508130654.5a566fc9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 7 May 2013 23:00:39 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=aec71d643784db991eb74086fc0352f788c86120
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  CHANGES |  118 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 118 insertions(+), 0 deletions(-)
> 
> diff --git a/CHANGES b/CHANGES
> index 4e327a8..ba91242 100644
> --- a/CHANGES
> +++ b/CHANGES
> @@ -1,3 +1,121 @@
> +2013.05, Not released yet:
> +
> +        Architectures: ARC support, Blackfin support, FLAT binary
> +        format, ARM: Drop old CPU variants, add fa526/626, Marvell PJ4
> +
> +	Toolchains: Add new Microblaze external toolchains, Linaro
> +	ARM/Aarch64 updates, GCC 4.6.4 / 4.7.3 / 4.8.0 added to
> +	internal toolchain, default to GCC 4.7.x.

Minor nit: the first paragraph is indented with spaces, and the other
ones with one tab.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
