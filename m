From: Will Wagner <will_wagner@carallon.com>
Date: Mon, 11 Feb 2008 15:13:30 +0000
Subject: [Buildroot] Best way to add custom step
Message-ID: <47B0661A.6070605@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I need to add a custom step to my build process after the linux image is 
built into the binaries directory. I was wondering about what was the 
best way to go about this.

I could add my changes to the top level makefile or to the 
target\linux\Makefile.in file. Is one way better than the other? Is 
there a better way of doing this?

Thanks,

Will
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
