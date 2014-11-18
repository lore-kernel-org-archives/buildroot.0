From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 21:59:21 +0100
Subject: [Buildroot] [PATCH 1/2] arch/powerpc: add fsl e5500 and e6500
 support
In-Reply-To: <20141118183139.GO2196@tarshish>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>
 <1416266092-6465-2-git-send-email-gustavo@zacarias.com.ar>
 <CANQCQpbtbch9q-HKXFhQRkKxYpr1FD9nhebwpiaj=65O_Pm+xQ@mail.gmail.com>
 <546B5779.9010708@zacarias.com.ar>
 <20141118162020.02921a54@free-electrons.com>
 <546B7395.4040804@zacarias.com.ar>
 <20141118175637.49a03275@free-electrons.com>
 <20141118183139.GO2196@tarshish>
Message-ID: <20141118215921.50bf97f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Tue, 18 Nov 2014 20:31:39 +0200, Baruch Siach wrote:

> On Tue, Nov 18, 2014 at 05:56:37PM +0100, Thomas Petazzoni wrote:
> > I guess if we go multilib, we should build the C library for both
> > "variants", but then build the rest of the userspace with only one of
> > the two variants, and keep the other variant just to build the special
> > stuff (kernel, bootloader, etc.).
> 
> Please forgive my ignorance, but why do we need a C library to build bare 
> metal software like the kernel and bootloaders?

We indeed normally don't in theory. It would be interesting to see if we
can actually build things like grub with a bare metal x86 32 bits
toolchain. I fear that in practice things might be a bit more
complicated, but it would be worth testing.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
