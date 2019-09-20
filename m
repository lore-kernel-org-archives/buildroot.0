From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 20 Sep 2019 10:51:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: remove empty
 consecutive lines
In-Reply-To: <20190920084657.6739-1-nolange79@gmail.com>
References: <20190920084657.6739-1-nolange79@gmail.com>
Message-ID: <CADYdroMBn8xjytDNLcXafaamAFVim_C7Ti0wvvtQDQ7zse6oUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, nothing to see here.
used wrong directory.

Am Fr., 20. Sept. 2019 um 10:47 Uhr schrieb Norbert Lange <nolange79@gmail.com>:
>
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
> Fixes the following check-package warning:
>
> package/libglib2/libglib2.mk:90: consecutive empty lines
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/libglib2/libglib2.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index 1d5562e017..73ea27f4d1 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -87,7 +87,6 @@ else
>  LIBGLIB2_CONF_OPTS += -Dlibmount=false
>  endif
>
> -
>  # Purge useless binaries from target
>  define LIBGLIB2_REMOVE_DEV_FILES
>         rm -rf $(TARGET_DIR)/usr/lib/glib-2.0
> --
> 2.23.0
>
