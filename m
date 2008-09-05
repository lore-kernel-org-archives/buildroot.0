From: danieljlaird at hotmail.com <danieljlaird@hotmail.com>
Date: Fri, 5 Sep 2008 18:44:05 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/freetype
In-Reply-To: <20080905010349.6D501F800B@busybox.net>
	<87iqtagbry.fsf@macbook.be.48ers.dk>
References: <20080905010349.6D501F800B@busybox.net>
	<87iqtagbry.fsf@macbook.be.48ers.dk>
Message-ID: <COL102-DS8F90489E9F7026AD165EEDC580@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I use freetype etc so I will look into 'auto tooling' it within the next 
couple of weeks.
I am currently testing version bumps of GLIB, GTK, CAIRO, PIXMAN etc.  Once 
done will feedback.

As well as trying to do the dir move stuff.
As indicated I hope to move all the block device stuff and xml tools stuff 
next.

Cheers
Dan

--------------------------------------------------
From: "Peter Korsgaard" <jacmet@uclibc.org>
Sent: Friday, September 05, 2008 10:52 AM
To: <buildroot@uclibc.org>
Subject: Re: [Buildroot] svn commit: trunk/buildroot/package/freetype

>>>>>> "hamish" == hamish  <hamish@uclibc.org> writes:
>
> Hi,
>
> hamish> Author: hamish
> hamish> Date: 2008-09-04 18:03:45 -0700 (Thu, 04 Sep 2008)
> hamish> New Revision: 23325
>
> hamish> Log:
> hamish> Version bump to 2.3.7
> hamish> This package should be converted to use Makefile.autotools.in
> hamish> by someone who uses it..
>
> Heh ;)
>
> hamish> Changeset:
> hamish> Modified: trunk/buildroot/package/freetype/Config.in
> hamish> 
> ===================================================================
> hamish> --- trunk/buildroot/package/freetype/Config.in 2008-09-04 16:16:47 
> UTC (rev 23324)
> hamish> +++ trunk/buildroot/package/freetype/Config.in 2008-09-05 01:03:45 
> UTC (rev 23325)
> hamish> @@ -16,12 +16,12 @@
> hamish>  config BR2_FREETYPE_VERSION_2_2_1
> hamish>  bool "Freetype 2.2.1"
>
> hamish> - config BR2_FREETYPE_VERSION_2_3_5
> hamish> - bool "Freetype 2.3.5"
> hamish> + config BR2_FREETYPE_VERSION_2_3_7
> hamish> + bool "Freetype 2.3.7"
>
> Please use 2_3_x like we do it for busybox and haserl so kconfig will
> do the right thing when you update your buildroot snapshot.
>
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
> 
