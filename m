From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Fri, 25 Jun 2010 12:00:27 +0200
Subject: [Buildroot] [PATCH v4] package: Add support for pidgin/finch
	instant messenger (2.7.1)
In-Reply-To: <20100625091927.4c67886b@surf>
References: <201005140300.25098.PeterHuewe@gmx.de>
	<201006241726.25775.PeterHuewe@gmx.de>
	<20100625091927.4c67886b@surf>
Message-ID: <201006251200.27398.PeterHuewe@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Freitag 25 Juni 2010 09:19:27 schrieb Thomas Petazzoni:
> On Thu, 24 Jun 2010 17:26:25 +0200
> 
> Peter Huewe <PeterHuewe@gmx.de> wrote:
> > +	select BR2_PACKAGE_GNUTTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
> 
>                            ^^^ should be BR2_PACKAGE_GETTEXT
> 
> Otherwise, looks good, I think the next version will get by Acked-by :-)
> 
> Thomas
> 

Then it seems to be wrong in the documentation - esspecially if you look at 
the extra T in GNUT :)

>Packages that need gettext only when locale support is enabled should:
>
>   1. Use select BR2_PACKAGE_GNUTTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE and 
>possibly select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE if libintl 
>is also needed


http://buildroot.org/downloads/buildroot.html#gettext-integration 
Maybe we should change that - patch comes in the next message ;)

Peter
