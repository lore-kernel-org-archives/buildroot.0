From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 17 Jul 2014 19:50:52 +0200
Subject: [Buildroot] [PATCH 2/2] Update documentation of AUTORECONF_ENV
In-Reply-To: <38A5475DE83986499AEACD2CFAFC3F9801148D7162@tss-server1.home.tropicalstormsoftware.com>
References: <38A5475DE83986499AEACD2CFAFC3F9801148D7162@tss-server1.home.tropicalstormsoftware.com>
Message-ID: <CAAXf6LWH4MQKfDhtj5u9fSK+C4zTLMAs04xN6KzOtUBQfKoe3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rick,

On Thu, Jul 17, 2014 at 2:28 PM, Rick Taylor
<rick@tropicalstormsoftware.com> wrote:
> From e7e05bc231fe8d3f7855761ce533fd53829a48c3 Mon Sep 17 00:00:00 2001
> From: Rick Taylor <rick.taylor@cassidian.com>
> Date: Thu, 17 Jul 2014 13:25:35 +0100
> Subject: [PATCH 2/2] Update documentation of AUTORECONF_ENV
>
> Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
> ---
>  docs/manual/adding-packages-autotools.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/docs/manual/adding-packages-autotools.txt b/docs/manual/adding-packages-autotools.txt
> index 3f40503..a1a4b90 100644
> --- a/docs/manual/adding-packages-autotools.txt
> +++ b/docs/manual/adding-packages-autotools.txt
> @@ -121,6 +121,11 @@ cases, typical packages will therefore only use a few of them.
>    automake, libtool, etc.). Valid values are +YES+ and
>    +NO+. By default, the value is +NO+
>
> +* +LIBFOO_AUTORECONF_ENV+, to specify additional environment
> +  variables to pass the 'autoreconf' program if

to pass to

> +  +LIBFOO_AUTORECONF=YES+. These are passed before
> +  the 'autoreconf' command. By default, empty.

I find 'before' odd here. I would rather say:
These are passed in the environment of the ...

Best regards,
Thomas
