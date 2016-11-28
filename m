From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 21:14:11 +0100
Subject: [Buildroot] [PATCH v1 0/3] efibootmgr: build with uClibc
In-Reply-To: <20161128163553.173811-1-andriy.shevchenko@linux.intel.com>
References: <20161128163553.173811-1-andriy.shevchenko@linux.intel.com>
Message-ID: <20161128211411.28555fc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 18:35:50 +0200, Andy Shevchenko wrote:
> These patches make possible to use efibootmgr with uClibc. All patches had been
> sent to upstream.
> 
> I have tested in my environment that doesn't use unicode characters. So, any
> additional tests are appreciated.
> 
> Andy Shevchenko (3):
>   efivar: bump to version 30
>   efivar: allow build with uClibc
>   efibootmrg: Allow build with uClibc

Why did you resend those patches? You already sent them yesterday, and
I already applied them to our next branch. I even made some comments,
which are anyway not taken into account in this new iteration.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
