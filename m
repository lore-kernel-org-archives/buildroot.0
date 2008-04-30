From: Grant Likely <grant.likely@secretlab.ca>
Date: Wed, 30 Apr 2008 07:22:06 -0600
Subject: [Buildroot] Buildroot tutorial for Xilinx ML405
In-Reply-To: <46a136670804300555p5973098dh7f0812df3a389a43@mail.gmail.com>
References: <0ad501c8aabb$9f580050$ad289e86@LPSC0173W>
	<46a136670804300555p5973098dh7f0812df3a389a43@mail.gmail.com>
Message-ID: <fa686aa40804300622w37029156kad6aa35d5e90b238@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 30, 2008 at 6:55 AM, John Voltz <john.voltz@gmail.com> wrote:
> Very interesting. I've always been interested in FPGAs, but never found a
> reason to use them. I've got an Altium Nanoboard that has been gathering
> dust on a shelf for years.
>
> So how fast can you run a PowerPC core on an FPGA anyway?

The Virtex parts have 1 or more hard powerpc 405 or 440 cores
(dedicated silicon, not synthesized in the FPGA) attached to the FPGA
fabric.  I believe they can run up to 400MHz.

> Is it possible to
> get video out of that board too?

Yes, the ML405 has a VGA port.

> What kind of licensing goes along with the
> IP cores if you commercialize a design?

Xilinx provides a set of stock cores for common devices.  Some of them
require licensing fees, some are free.

> Are the cores free for tinkering, or
> do you have to buy them?

You can also use the stuff from opencores.org

Cheers,
g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
