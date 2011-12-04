From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 4 Dec 2011 12:47:36 +0200
Subject: [Buildroot] [PATCH 2/2] ebtables: bump to version 2.0.10-2
In-Reply-To: <1322858749-16654-2-git-send-email-gustavo@zacarias.com.ar>
References: <1322858749-16654-1-git-send-email-gustavo@zacarias.com.ar>
 <1322858749-16654-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20111204104735.GC2328@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Fri, Dec 02, 2011 at 05:45:49PM -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/ebtables/ebtables.mk |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/package/ebtables/ebtables.mk b/package/ebtables/ebtables.mk
> index 6cfdfdc..66242a4 100644
> --- a/package/ebtables/ebtables.mk
> +++ b/package/ebtables/ebtables.mk
> @@ -3,7 +3,8 @@
>  # ebtables
>  #
>  #############################################################
> -EBTABLES_VERSION = 2.0.10-1
> +
> +EBTABLES_VERSION = 2.0.10-2
>  EBTABLES_SOURCE = ebtables-v$(EBTABLES_VERSION).tar.gz
>  EBTABLES_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ebtables

Version 2.0.10-3 has now been released. Care to update?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
