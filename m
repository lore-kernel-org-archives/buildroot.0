From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2011 09:58:09 +0100
Subject: [Buildroot] Adding Microblaze support to Buildroot
In-Reply-To: <4ECB62C8.6030301@relinux.de>
References: <4EBC554E.7050605@gmail.com> <4EBC5656.2010103@gmail.com>
 <4EBD18F1.6020804@relinux.de> <4ECB62C8.6030301@relinux.de>
Message-ID: <20111122095809.2ad28649@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 22 Nov 2011 09:52:24 +0100,
Stephan Hoffmann <sho@relinux.de> a ?crit :

> is there an interest in adding the Microblaze architecture to
> buildroot?

Definitely, yes.

> And, if it is, would it be acceptable to rely on toolchain and/or
> bootloader coming from the board vendor or Xilinx, at least for some
> time?

Yes. It is possible to use the external toolchain mechanism. For
example, the Blackfin support relies on an external toolchain provided
by ADI, I'm not sure the internal Buildroot code to build a toolchain
works for Blackfin. So doing the same for Microblaze seems reasonable.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
