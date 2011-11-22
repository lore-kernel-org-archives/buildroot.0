From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Nov 2011 10:14:00 +0100
Subject: [Buildroot] Adding Microblaze support to Buildroot
In-Reply-To: <4ECB62C8.6030301@relinux.de> (Stephan Hoffmann's message of
 "Tue, 22 Nov 2011 09:52:24 +0100")
References: <4EBC554E.7050605@gmail.com> <4EBC5656.2010103@gmail.com>
 <4EBD18F1.6020804@relinux.de> <4ECB62C8.6030301@relinux.de>
Message-ID: <87sjlgplif.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 Stephan> Hello all,

 Stephan> is there an interest in adding the Microblaze architecture to
 Stephan> buildroot?

Yes, I would say so.

 Stephan> And, if it is, would it be acceptable to rely on toolchain
 Stephan> and/or bootloader coming from the board vendor or Xilinx, at
 Stephan> least for some time?

We're doing that already for avr32, so that's not really a big
problem. I'm more worrying about how much we need to patch individual
packages to work on microblaze. In the past we had quite some avr32
patches, which made it harder to move to newer versions and added extra
complexity to BR.

But as long as the microblaze developers work on getting their changes
upstream, I don't have a problem with adding microblaze support.

-- 
Bye, Peter Korsgaard
