From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Jul 2012 18:49:05 +0200
Subject: [Buildroot] [PATCH] crosstool-ng: bump to version 1.15.3
In-Reply-To: <1343312375-8339-1-git-send-email-net147@gmail.com>
References: <1343312375-8339-1-git-send-email-net147@gmail.com>
Message-ID: <201207261849.05831.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathan, All,

On Thursday 26 July 2012 16:19:35 Jonathan Liu wrote:
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  package/crosstool-ng/crosstool-ng.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
> index 4bf0258..379d400 100644
> --- a/package/crosstool-ng/crosstool-ng.mk
> +++ b/package/crosstool-ng/crosstool-ng.mk
> @@ -1,4 +1,4 @@
> -CROSSTOOL_NG_VERSION           = 1.15.2
> +CROSSTOOL_NG_VERSION           = 1.15.3
>  CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
>  CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
>  CROSSTOOL_NG_INSTALL_TARGET    = NO

Yes, there's a new release for crosstool-NG.

But the next major release is due end of the month (Real Soon Now!), so I
believe we can wait until then before we update the version in buildroot.
Hence the reason why I did not push 1.15.3 to buildroot when I released it.

Of course, it's up to the maintainer (or his current substitute!) to accept
your change, to which I do not object on a technical basis.

Thomas, if you want to pull this change, you can add my:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
