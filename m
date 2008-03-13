From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 13 Mar 2008 07:26:15 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <47D82493.6090505@carallon.com>
References: <20080312135303.CCD1B120150@busybox.net>
	<47D82493.6090505@carallon.com>
Message-ID: <1205389575.6797.7.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2008-03-12 at 18:44 +0000, Will Wagner wrote:
> ninevoltz at uclibc.org wrote:

<snipp>

> > -config BR2_PACKAGE_QTOPIA4_DEPTHS
> > -	string "color depths to support"
> > -	default "-depths 8"
> > -	depends BR2_PACKAGE_QTOPIA4
> > -	help
> > -	    Which color depths to support for the library. Default is "-depths
> > -	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
> > -
> 
> Why have you removed the option to configure supported colour depths?
> 

Why do you need it? It would only reduce the footprint by some kB anyway
to specify a specific color depth.

Not specifying -depths will give you all depths supported by Qt
Embedded.

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
