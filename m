From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jan 2015 23:28:23 +0100
Subject: [Buildroot] [PATCH 1/2] package/intel-microcode: bump version
In-Reply-To: <1419156571-12002-1-git-send-email-bernd.kuhls@t-online.de>
References: <1419156571-12002-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150119222823.GG4217@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-12-21 11:09 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Sorry for the delay...

There is a newer version available, 20150107:
    http://feeds.downloadcenter.intel.com/rss/?p=2371

Would you care to update, please?

Thank you! :-)

Regards,
Yann E. MORIN.

> ---
>  package/intel-microcode/intel-microcode.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index bae953d..640d6fb 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -INTEL_MICROCODE_VERSION = 20140122
> +INTEL_MICROCODE_VERSION = 20140913
>  INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
> -INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/23574/eng
> +INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/24290/eng
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license.txt
>  INTEL_MICROCODE_REDISTRIBUTE = NO
> -- 
> 1.7.10.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
