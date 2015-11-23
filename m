From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 18:12:39 +0100
Subject: [Buildroot] [PATCH] wireshark: bump version to 2.0.0
In-Reply-To: <1448294244-56143-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1448294244-56143-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151123171239.GD3857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-11-23 15:57 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr: build-tested only]
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/wireshark/wireshark.hash | 6 ++----
>  package/wireshark/wireshark.mk   | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
> index ee50e3f..c1e1d58 100644
> --- a/package/wireshark/wireshark.hash
> +++ b/package/wireshark/wireshark.hash
> @@ -1,4 +1,2 @@
> -# From https://www.wireshark.org/download/SIGNATURES-1.12.8.txt
> -sha1	d8c23120525a2f3505e822b7684e7367bcd0ba70	wireshark-1.12.8.tar.bz2
> -# Calculated based on the hash above
> -sha256	357e0a4e49525d80cdc740bb16539fcdb526ad38cc2ed6cabedafc9bdee5c7e7	wireshark-1.12.8.tar.bz2
> +# From: https://www.wireshark.org/download/src/all-versions/SIGNATURES-2.0.0.txt
> +sha256 90026c761a85701d7783c7e2eaa4c1de247dfbadbd53221df355f121e42691dd  wireshark-2.0.0.tar.bz2
> diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
> index ffadf80..366134d 100644
> --- a/package/wireshark/wireshark.mk
> +++ b/package/wireshark/wireshark.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WIRESHARK_VERSION = 1.12.8
> +WIRESHARK_VERSION = 2.0.0
>  WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.bz2
>  WIRESHARK_SITE = http://www.wireshark.org/download/src/all-versions
>  WIRESHARK_LICENSE = wireshark license
> -- 
> 2.4.10
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
