From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 17:17:10 +0100
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable wordexp
 functionality
In-Reply-To: <1490112708.19767.139.camel@linux.intel.com>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
 <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
 <20170321170614.161e8eec@free-electrons.com>
 <1490112708.19767.139.camel@linux.intel.com>
Message-ID: <20170321171710.79befd08@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 18:11:48 +0200, Andy Shevchenko wrote:

> >  I.e the
> > size of uClibc without/with this option enabled, for example on ARM?  
> 
> No, I have no ARM board to test this. Or you mean to built entire stack
> what I'm using for some arbitrary ARM board?

You don't need a ARM board. Just make a Buildroot build for ARM with
uClibc (wordexp disabled), look at the uClibc size, and then the same
build but this time with your patch applied (which enables wordexp).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
