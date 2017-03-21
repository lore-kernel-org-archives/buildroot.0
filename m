From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 21 Mar 2017 18:23:06 +0200
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable wordexp
 functionality
In-Reply-To: <20170321171710.79befd08@free-electrons.com>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
 <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
 <20170321170614.161e8eec@free-electrons.com>
 <1490112708.19767.139.camel@linux.intel.com>
 <20170321171710.79befd08@free-electrons.com>
Message-ID: <1490113386.19767.140.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2017-03-21 at 17:17 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 21 Mar 2017 18:11:48 +0200, Andy Shevchenko wrote:
> 
> > > ?I.e the
> > > size of uClibc without/with this option enabled, for example on
> > > ARM???
> > 
> > No, I have no ARM board to test this. Or you mean to built entire
> > stack
> > what I'm using for some arbitrary ARM board?
> 
> You don't need a ARM board. Just make a Buildroot build for ARM with
> uClibc (wordexp disabled), look at the uClibc size, and then the same
> build but this time with your patch applied (which enables wordexp).

Got it.
Will do when will have time later this week.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
