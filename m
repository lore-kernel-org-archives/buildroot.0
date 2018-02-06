From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 6 Feb 2018 19:43:07 +0100
Subject: [Buildroot] [git commit branch/next] package/glibc: security
 bump to 2.27
In-Reply-To: <20180206165004.dvzsqefosys3ofld@tarshish>
References: <20180206124246.13C0B884B3@busybox.osuosl.org>
 <20180206165004.dvzsqefosys3ofld@tarshish>
Message-ID: <CANLo3JjKkTHaZUgTjQ2-Pq114K3EbAO7yr74u4U-Wa5NW7z+5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 6 f?vr. 2018 17:50, "Baruch Siach" <baruch@tkos.co.il> a ?crit :

Hi Thomas,

On Tue, Feb 06, 2018 at 01:41:48PM +0100, Thomas Petazzoni wrote:
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index cf4bdec065..b674191b22 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-
arc-processors,glibc,$(GLIBC_VE
>  else
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40
origin/release/MAJOR.MINOR/master
> -GLIBC_VERSION = glibc-2.26-107-g73a92363619e52c458146e903dfb9b1ba823aa40
> +GLIBC_VERSION = glibc-2.27
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not
reliable,
>  # sometimes the connection times out. So use an unofficial github mirror.

Any reason not to use upstream tarball now that we use an official release?

  https://ftp.gnu.org/gnu/glibc/glibc-2.27.tar.xz


We are expecting to follow the glibc 2.27 stable branch as soon as new
commits are backported, so keep git things in place.

Romain



baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180206/6966f94f/attachment.html>
