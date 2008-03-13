From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 13 Mar 2008 11:27:06 +0000
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <1205407308.8626.10.camel@localhost>
References: <20080312135303.CCD1B120150@busybox.net>	
	<47D82493.6090505@carallon.com>
	<1205389575.6797.7.camel@localhost>	
	<47D90410.7000409@carallon.com>
	<1205407308.8626.10.camel@localhost>
Message-ID: <47D90F8A.1060202@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> 
>  ~ > du -sk usr/lib/libQt*so.4.4.0 | sort -n
> 48      usr/lib/libQtTest.so.4.4.0
> 160     usr/lib/libQtXml.so.4.4.0
> 196     usr/lib/libQtSvg.so.4.4.0
> 396     usr/lib/libQtNetwork.so.4.4.0
> 492     usr/lib/libQtScript.so.4.4.0
> 1792    usr/lib/libQtCore.so.4.4.0
> 5436    usr/lib/libQtGui.so.4.4.0
> 
> These are stripped binaries.
> 
> That is roughly 8 MB of shared libraries, give or take a few kB's will
> also depend a lot on your compiler.

Yes but I'm using static linking, only core and gui and I have removed 
all the unneeded features for my target, the footprint for me is much 
smaller.

> 

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
