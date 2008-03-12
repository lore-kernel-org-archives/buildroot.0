From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 12 Mar 2008 18:44:35 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <20080312135303.CCD1B120150@busybox.net>
References: <20080312135303.CCD1B120150@busybox.net>
Message-ID: <47D82493.6090505@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ninevoltz at uclibc.org wrote:
> Author: ninevoltz
> Date: 2008-03-12 06:53:02 -0700 (Wed, 12 Mar 2008)
> New Revision: 21315
> 
> Log:
> Fix Qtopia Core 4 compile and installation and bump to version 4.4.0
> 
> Modified:
>    trunk/buildroot/package/qtopia4/Config.in
>    trunk/buildroot/package/qtopia4/qtopia4.mk
> 
> 
> Changeset:
> Modified: trunk/buildroot/package/qtopia4/Config.in
> ===================================================================
> --- trunk/buildroot/package/qtopia4/Config.in	2008-03-12 13:11:29 UTC (rev 21314)
> +++ trunk/buildroot/package/qtopia4/Config.in	2008-03-12 13:53:02 UTC (rev 21315)

snip

>  
> -config BR2_PACKAGE_QTOPIA4_DEPTHS
> -	string "color depths to support"
> -	default "-depths 8"
> -	depends BR2_PACKAGE_QTOPIA4
> -	help
> -	    Which color depths to support for the library. Default is "-depths
> -	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
> -

Why have you removed the option to configure supported colour depths?

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
