From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Mar 2013 22:39:17 +0100
Subject: [Buildroot] [PATCH 4/4] argp-standalone: add license information
In-Reply-To: <1364160848-15168-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364160848-15168-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364160848-15168-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <201303242239.18024.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 24 March 2013 Thomas Petazzoni wrote:
> There is unfortunately no license file.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/argp-standalone/argp-standalone.mk |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/argp-standalone/argp-standalone.mk b/package/argp-standalone/argp-standalone.mk
> index ba7f757..4fc4321 100644
> --- a/package/argp-standalone/argp-standalone.mk
> +++ b/package/argp-standalone/argp-standalone.mk
> @@ -7,6 +7,7 @@
>  ARGP_STANDALONE_VERSION = 1.3
>  ARGP_STANDALONE_SITE = http://www.lysator.liu.se/~nisse/archive
>  ARGP_STANDALONE_INSTALL_STAGING = YES
> +ARGP_STANDALONE_LICENSE = LGPLv2+

It is indeed LGPLV2+
LGPLV2 almost never existed, so it's weird enough to warrant a double-check...

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
