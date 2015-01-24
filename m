From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 24 Jan 2015 19:13:20 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/intel-microcode: bump
 version to 20150107, add hash
In-Reply-To: <1422121699-1922-1-git-send-email-bernd.kuhls@t-online.de>
References: <1422121699-1922-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150124181320.GC4001@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-01-24 18:48 +0100, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Manually downloaded and verified the hash.

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: added hash (Yann)
> 
>  package/intel-microcode/intel-microcode.hash |    2 ++
>  package/intel-microcode/intel-microcode.mk   |    4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
>  create mode 100644 package/intel-microcode/intel-microcode.hash
> 
> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
> new file mode 100644
> index 0000000..e46f7b0
> --- /dev/null
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -0,0 +1,2 @@
> +# Locally computed by Yann (http://lists.busybox.net/pipermail/buildroot/2015-January/117918.html) and me
> +sha256	f5e7fb58643b2bf327eedf7bd91780fd5dfe74397552977cc77194c165910255	microcode-20150107.tgz
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
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150124/78a3fa6e/attachment.asc>
