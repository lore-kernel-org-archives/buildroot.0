From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 09:32:56 +0100
Subject: [Buildroot] PowerPC64 toolchain not building
In-Reply-To: <20160127043858.GB6719@tungsten.ozlabs.ibm.com>
References: <20160123150731.1c1db4b0@free-electrons.com>
 <20160124191236.GQ17143@waldemar-brodkorb.de>
 <20160124213607.6e3b1257@free-electrons.com>
 <20160127043858.GB6719@tungsten.ozlabs.ibm.com>
Message-ID: <20160127093256.77169e7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jan 2016 15:38:58 +1100, Sam Bobroff wrote:

> I have a bit of experience with buildroot on PowerPC64 so I also attempted to
> replicate this, but I could not. I don't know the rest of your config but I
> did match the values you posted above. An operand error like that could be
> related to the specific architecture version the assembler is expecting, so
> changing the "target architecture variant" is probably worth trying (try
> "generic").

Thanks a lot for having looked at the problem!

You need to select the power8 processor for the issue to reproduce. It
doesn't appear with power7 for example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
