From: Joachim Pihl <joachim.pihl@sensordevelopments.com>
Date: Fri, 10 Sep 2010 08:40:35 +0200
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <20100907150948.4de996e3@surf>
References: <op.vinvdkgksev97k@joachim-lappis> <20100907150948.4de996e3@surf>
Message-ID: <op.vis0txzcsev97k@joachim-lappis>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 07 Sep 2010 15:09:48 +0200, Thomas Petazzoni  
<thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 07 Sep 2010 13:54:46 +0200
> "Joachim Pihl" <joachim.pihl@sensordevelopments.com> wrote:
>
>> Trying to build defconfig for ATNGW100 AVR32 card, and having this
>> problem (after moving to uClibc 0.9.30 to avoid asm/unaligned.h
>> problem):
>
> Ah, so the toolchain didn't build with uClibc 0.9.31 ? Strange, I
> thought I tested this. Will try to reproduce.

Now it worked, for some reason. Will now try to build it back into  
all-defaults and see where the problem really is...


>
> Thanks for the report! I've pushed an untested fix at
> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?h=for-2010.11/kernel-image-formats&id=4b682d0fb9c3a6276267a875a0e3bb7e0c49e91d.
>
> It's in my kernel-image-formats branch that I will push sooner or later
> to Peter.

Patch confirmed to be working.


-- 
Joachim Pihl
Development engineer
SENSOR DEVELOPMENTS AS
Tlf: +47 913 39 891
Nordre Kuller?d 21
NO-3241 Sandefjord
NORWAY
