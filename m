From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Jun 2013 18:08:06 +0200
Subject: [Buildroot] [PATCH 4/4] package/w_scan: new package
In-Reply-To: <87ip0z332b.fsf@dell.be.48ers.dk>
References: <cover.1372019882.git.yann.morin.1998@free.fr>
 <cover.1372019882.git.yann.morin.1998@free.fr>
 <a4416db33352923370280841140fb56daa85fd86.1372019882.git.yann.morin.1998@free.fr>
 <87ip0z332b.fsf@dell.be.48ers.dk>
Message-ID: <20130628160806.GA3165@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2013-06-27 18:56 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  Yann> ---
>  Yann>  package/Config.in        |  1 +
>  Yann>  package/w_scan/Config.in |  9 +++++++++
>  Yann>  package/w_scan/w_scan.mk | 13 +++++++++++++
>  Yann>  3 files changed, 23 insertions(+)
>  Yann>  create mode 100644 package/w_scan/Config.in
>  Yann>  create mode 100644 package/w_scan/w_scan.mk
> 
>  Yann> +###############################################################################
>  Yann> +#
>  Yann> +# w_scan
>  Yann> +#
>  Yann> +###############################################################################
>  Yann> +
>  Yann> +W_SCAN_VERSION              = 20130331
>  Yann> +W_SCAN_SOURCE               = w_scan-$(W_SCAN_VERSION).tar.bz2
>  Yann> +W_SCAN_SITE                 = http://wirbel.htpc-forum.de/w_scan
>  Yann> +W_SCAN_LICENSE              = GPLv2+
>  Yann> +W_SCAN_LICENSE_FILES        = COPYING
> 
> It uses iconv.h, so I changed it to pull in libiconv if the toolchain
> doesn't have locale.

OK, thanks. My test environment is glibc-based, so I did not catch this
(and honestly, I was relying on the autobuilders to eventually catch it).

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
