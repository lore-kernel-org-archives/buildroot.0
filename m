From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 18:04:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version
	to 20150107
In-Reply-To: <1422117876-20617-1-git-send-email-bernd.kuhls@t-online.de>
References: <1422117876-20617-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150124170442.GB4001@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-01-24 17:44 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/intel-microcode/intel-microcode.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index 640d6fb..4e8ea90 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -INTEL_MICROCODE_VERSION = 20140913
> +INTEL_MICROCODE_VERSION = 20150107
>  INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
> -INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/24290/eng
> +INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/24616/eng
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license.txt
>  INTEL_MICROCODE_REDISTRIBUTE = NO

The microcode is a sensitive piece of stuff, so having a hash file for
it would be really nice. Here's the sah256 computed locally here:

    sha256  f5e7fb58643b2bf327eedf7bd91780fd5dfe74397552977cc77194c165910255  microcode-20150107.tgz

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
