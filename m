From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 06 Sep 2007 08:46:57 +0100
Subject: [Buildroot] Qtopia 4.3.1 on X86
In-Reply-To: <1189062690.13373.11.camel@cyclops.infocab.com.au>
References: <1189062690.13373.11.camel@cyclops.infocab.com.au>
Message-ID: <46DFB071.105@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This sounds a lot like the problem I had here:

http://buildroot.uclibc.org/lists/buildroot/2007-August/004797.html

Hope that helps,

Will.

Adam Hawes wrote:
> Hi,
> 
> I'm trying to build Qtopia in Buildroot for X86.  I've had a lot of
> issues with "macro index requires 2 arguments...".  The only solution
> I've found is to undefine that macro in all the files where it
> complains.
> 
> Has anyone else found a more elegant solution to this problem? Is there
> a patch available or should I submit my patch to Qtopia to the list?
> 
> Cheers,
> A
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
