From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Aug 2018 23:10:01 +0200
Subject: [Buildroot] [PATCH 18/18] Add to DEVELOPERS file
In-Reply-To: <20180810161502.21598-19-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-19-chrismcc@gmail.com>
Message-ID: <20180810231001.582f28e3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 09:15:02 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  DEVELOPERS | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 215506c71c..c693f6765b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -479,6 +479,25 @@ F:	package/python-rtslib-fb/
>  F:	package/python-urwid/
>  F:	package/targetcli-fb/
>  
> +N:	Christopher McCrory <chrismcc@gmail.com>
> +F:	package/perl-appconfig
> +F:	package/perl-astro-suntime
> +F:	package/perl-cgi
> +F:	package/perl-class-std
> +F:	package/perl-data-uuid
> +F:	package/perl-date-manip
> +F:	package/perl-dbi
> +F:	package/perl-device-serialport
> +F:	package/perl-file-slurp
> +F:	package/perl-io-interface
> +F:	package/perl-json-maybexs
> +F:	package/perl-module-runtime
> +F:	package/perl-number-bytes-human
> +F:	package/perl-params-util
> +F:	package/perl-sub-install
> +F:	package/perl-sys-meminfo
> +F:	package/perl-sys-mmap

This should normally be done in each patch adding each individual
package. Indeed, if I partially merge your patch series (say up to
patch 10), then you won't be added to the DEVELOPERS file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
