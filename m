From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 13 Mar 2008 10:38:08 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <1205389575.6797.7.camel@localhost>
References: <20080312135303.CCD1B120150@busybox.net>	
	<47D82493.6090505@carallon.com> <1205389575.6797.7.camel@localhost>
Message-ID: <47D90410.7000409@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hans-Christian Egtvedt wrote:
> On Wed, 2008-03-12 at 18:44 +0000, Will Wagner wrote:
>> ninevoltz at uclibc.org wrote:
> 
> <snipp>
> 
>>> -config BR2_PACKAGE_QTOPIA4_DEPTHS
>>> -	string "color depths to support"
>>> -	default "-depths 8"
>>> -	depends BR2_PACKAGE_QTOPIA4
>>> -	help
>>> -	    Which color depths to support for the library. Default is "-depths
>>> -	    8". Is specified by a comma separated list, i.e. -depths 24,16,8.
>>> -
>> Why have you removed the option to configure supported colour depths?
>>
> 
> Why do you need it? It would only reduce the footprint by some kB anyway
> to specify a specific color depth.

I want it exactly because it does save a few kB. Perhaps we should add 
it back in but change the default to all?

> 
> Not specifying -depths will give you all depths supported by Qt
> Embedded.
> 

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
