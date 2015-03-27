From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Mar 2015 22:07:29 +0100
Subject: [Buildroot] [PATCH] BINFMT_FLAT_SHARED: is not really shared
 for buildroot purposes
In-Reply-To: <1427489707-22707-1-git-send-email-arnout@mind.be>
References: <1427489707-22707-1-git-send-email-arnout@mind.be>
Message-ID: <20150327220729.38caa8d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Fri, 27 Mar 2015 21:55:07 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index b6615ce..7508cfa 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -208,8 +208,9 @@ information is (assuming the package name is +libfoo+) :
>    which Buildroot will use to download the tarball from
>    +LIBFOO_SITE+. If +HOST_LIBFOO_SOURCE+ is not specified, it defaults
>    to +LIBFOO_SOURCE+. If none are specified, then the value is assumed
> -  to be +libfoo-$(LIBFOO_VERSION).tar.gz+. + Example: +LIBFOO_SOURCE =
> -  foobar-$(LIBFOO_VERSION).tar.bz2+
> +  to be +libfoo-$(LIBFOO_VERSION).tar.gz+.
> +  +
> +  Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
>  
>  * +LIBFOO_PATCH+ may contain a space-separated list of patch file
>    names, that Buildroot will download and apply to the package source

Probably this part was not meant to be part of the patch, right? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
