From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Oct 2012 15:31:01 +0100
Subject: [Buildroot] RPC.h and busybox
In-Reply-To: <20121031114118.GF30343@sapphire.tkos.co.il>
References: <CABtOAfwBq_mbzxnaBd8s0Wu4PeYOiVWUr5AXoZCcaxL5o=T4MQ@mail.gmail.com>
 <20121031114118.GF30343@sapphire.tkos.co.il>
Message-ID: <20121031153101.41b26063@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Wed, 31 Oct 2012 13:41:18 +0200, Baruch Siach wrote:

> > Does anybody have any solution?
> 
> This is a toolchain level problem. Either downgrade to a toolchain with 2.13 
> glibc, or use a toolchain with tirpc.

I have posted a patch set some time ago that fixes this. It tells
Buildroot whether the toolchain has RPC support or not (even for
glibc/eglibc toolchains), and then is capable of building libtirpc when
the toolchain does not provide RPC support.

I intend to adjust a few things and update it, before resending it.
Maybe before the Buildroot meeting this week-end, maybe after.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
