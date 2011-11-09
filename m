From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Wed, 9 Nov 2011 09:04:10 +0100
Subject: [Buildroot] buildroot Digest, Vol 65, Issue 22
In-Reply-To: <mailman.2243.1320780341.2942.buildroot@busybox.net>
References: <mailman.2243.1320780341.2942.buildroot@busybox.net>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6702C398D3@WETMEX10.loepfe.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,
 

Noel> A) On Linux, no BUILDROOT is used to build a complete target, for
the  Noel> at91sam9g10, at91sam9m10 (arm-9).. And recently one for the
imx-537  Noel> (cortex-A8) (and x86 for test cases).

<<Peter >> Out of interest, have you done anything to integrate the
imx53 bootup sequence and/or gpu/vpu libraries in buildroot? I'm
considering the
<<Peter >> imx53 for a new project.


Peter, it is my intention to do this but at this time, no not yet.
I'm running buildroot-test-builds on the imx-QSB (for some weeks now).

At this time I grabbed 
A) The UBOOT-boot loader for the QSB-board demo SD card (I even did not
build an uboot yet)
B) Use buildroot to build the tool-chain (hardware FP and cortex A8,
gecko 4.5.x)
C) Grabbed the IMX-53x kernel patches from the imx-web-site and build
the 2.6.35.x kernel with buildroot.
D) Use buildroot to build a 'GRAPICHAL' ( X-windows) rootfs that
contains a web-server and web-client (web-browser).
E) .. Etc..



You know how it works :-), in the process of deciding what CPU-to take.

All this stuff is done manually, I trying to be ahead with the software,
we have no board yet, and the schematic (and pcb) for our board with the
IMX53x is being draw at this time.

I hope to get all this stuff nicely integrated with the next stable
buildroot, but at this time I'm experimenting (testing) to see where I
get.

And I must say, I'm not that experienced with buildroot as you are (you
might recall me form one of the internal-buildroot sessions you held
together with marc some years ago )

Regards Noel
