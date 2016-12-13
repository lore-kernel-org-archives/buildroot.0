From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 13 Dec 2016 13:37:17 +0200
Subject: [Buildroot] [PATCH v1 0/3] efibootmgr: build with uClibc
In-Reply-To: <20161128211411.28555fc5@free-electrons.com>
References: <20161128163553.173811-1-andriy.shevchenko@linux.intel.com>
 <20161128211411.28555fc5@free-electrons.com>
Message-ID: <1481629037.7188.65.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2016-11-28 at 21:14 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 28 Nov 2016 18:35:50 +0200, Andy Shevchenko wrote:
> > These patches make possible to use efibootmgr with uClibc. All
> > patches had been
> > sent to upstream.
> > 
> > I have tested in my environment that doesn't use unicode characters.
> > So, any
> > additional tests are appreciated.
> > 
> > Andy Shevchenko (3):
> > ? efivar: bump to version 30
> > ? efivar: allow build with uClibc
> > ? efibootmrg: Allow build with uClibc
> 
> Why did you resend those patches? You already sent them yesterday, and
> I already applied them to our next branch. I even made some comments,
> which are anyway not taken into account in this new iteration.

Sorry for a noise, I just now realized that mail infra on my side moved
your messages to junk. That's why I resend since I didn't hear from
anyone anything. Now I know the root cause.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
