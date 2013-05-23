From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 May 2013 20:13:52 +0200
Subject: [Buildroot] [PATCH v2 4/5] portaudio: add license information
In-Reply-To: <1369332544-5438-1-git-send-email-gilles.talis@gmail.com>
References: <1369332544-5438-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20130523181352.GE3250@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gilles, All,

On 2013-05-23 11:09 -0700, Gilles Talis spake thusly:
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thank you! :-)

> ---
>  package/portaudio/portaudio.mk |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
> index 34b0bd9..0efec5c 100644
> --- a/package/portaudio/portaudio.mk
> +++ b/package/portaudio/portaudio.mk
> @@ -9,6 +9,8 @@ PORTAUDIO_SITE = http://www.portaudio.com/archives
>  PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
>  PORTAUDIO_INSTALL_STAGING = YES
>  PORTAUDIO_MAKE = $(MAKE1)
> +PORTAUDIO_LICENSE = portaudio license (MIT-like plus special clause)
> +PORTAUDIO_LICENSE_FILES = LICENSE.txt
>  
>  PORTAUDIO_DEPENDENCIES = \
>  	$(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),alsa-lib)
> -- 
> 1.7.4.1
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
