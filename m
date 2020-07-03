From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2020 21:55:24 +0200
Subject: [Buildroot] [PATCH] package/execline: bump version to 2.6.1.0
In-Reply-To: <20200702232722.20960-1-sergio.prado@e-labworks.com>
References: <20200702232722.20960-1-sergio.prado@e-labworks.com>
Message-ID: <20200703195524.GB2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio, All,

On 2020-07-02 20:27 -0300, Sergio Prado spake thusly:
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  package/execline/execline.hash | 2 +-
>  package/execline/execline.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/execline/execline.hash b/package/execline/execline.hash
> index cef4959bda93..0f928aeef3bd 100644
> --- a/package/execline/execline.hash
> +++ b/package/execline/execline.hash
> @@ -1,3 +1,3 @@
>  # Locally generated
> -sha256 05205c6869ae65a51c63d0e805572573806f6474aa21e12c49dd5654d3ceed33  execline-2.5.3.0.tar.gz
> +sha256 a24c76f097ff44fe50b63b89bcde5d6ba9a481aecddbe88ee01b0e5a7b314556  execline-2.6.1.0.tar.gz
>  sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING

The license file has changed :

    >>> execline 2.6.1.0 Collecting legal info
    ERROR: COPYING has wrong sha256 hash:
    ERROR: expected: d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c
    ERROR: got     : 5443ac67e8d74ac614ced7bc64211ce90ccedb7778a68bfe9e68a8b234c9503e

Can you investigate why, and resubmit a new patch that updates the
license has, and explains in the commit log what changed (can be as
short as just "copyright year change: 2027->2042").

(and fix the spacing in the hash file while at it, like you did in
exempi)

Thanks! :-)

Regards,
Yann E. MORIN.

> diff --git a/package/execline/execline.mk b/package/execline/execline.mk
> index 74ad91e4a8a2..e2423e9536df 100644
> --- a/package/execline/execline.mk
> +++ b/package/execline/execline.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXECLINE_VERSION = 2.5.3.0
> +EXECLINE_VERSION = 2.6.1.0
>  EXECLINE_SITE = http://skarnet.org/software/execline
>  EXECLINE_LICENSE = ISC
>  EXECLINE_LICENSE_FILES = COPYING
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
