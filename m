From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 11:33:37 +0200
Subject: [Buildroot] [PATCH v2 4/8] package/mpd: enable support for
 libsoxr
In-Reply-To: <1413379134-28918-4-git-send-email-jkrause@posteo.de>
References: <1413379134-28918-1-git-send-email-jkrause@posteo.de>
 <1413379134-28918-4-git-send-email-jkrause@posteo.de>
Message-ID: <20141016113337.439d3720@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Wed, 15 Oct 2014 15:18:50 +0200, J?rg Krause wrote:
> Signed-off-by: J?rg Krause <jkrause@posteo.de>
> ---
> Changes v1 -> v2:
>   - none
> ---
>  package/mpd/Config.in | 7 +++++++
>  package/mpd/mpd.mk    | 7 +++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 10f3cf0..eba280a 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -46,6 +46,13 @@ config BR2_PACKAGE_MPD_LIBSAMPLERATE
>  		Enable libsamplerate input support.
>  		Select this for software sample rate conversion.
>  
> +config BR2_PACKAGE_MPD_LIBSOXR
> +	bool "libsoxr"
> +	select BR2_PACKAGE_LIBSOXR
> +	help
> +		Enable libsoxr resampler support.
> +		The SoX Resampler library performs software sample-rate conversion.
> +

I apologize for the silly comment, but the indentation is wrong here.
The help text should be indented with one tab plus two spaces, not two
tabs.

Same issue applies to patches 4, 5, 6 and 7 of your series.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
