From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 15:21:12 +0100
Subject: [Buildroot] [PATCHv3 04/15] directfb: do not use inexistant
 configure options
In-Reply-To: <1441144876-2628-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441144876-2628-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <55E9A8D8.4010105@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/01/2015 11:01 PM, Thomas Petazzoni wrote:
> From: Peter Seiderer <ps.report@gmx.net>
> 
> The --disable-sysfs and --disable-explicit-deps options are not
> supported by DirectFB anymore, so don't use them.

which version introduces such a change? Is it 1.7.7? If so, I think this
patch should be squashed with the one that does the version bump to
1.7.7. Otherwise, ignore my comment.

Regards,

Vincent.

> 
> [Thomas: rework commit log.]
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/directfb/directfb.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
> index c27e982..da12acb 100644
> --- a/package/directfb/directfb.mk
> +++ b/package/directfb/directfb.mk
> @@ -14,11 +14,9 @@ DIRECTFB_INSTALL_STAGING = YES
>  DIRECTFB_AUTORECONF = YES
>  
>  DIRECTFB_CONF_OPTS = \
> -	--disable-explicit-deps \
>  	--enable-zlib \
>  	--enable-freetype \
>  	--enable-fbdev \
> -	--disable-sysfs \
>  	--disable-sdl \
>  	--disable-vnc \
>  	--disable-osx \
> 
