From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Feb 2012 20:12:38 +0100
Subject: [Buildroot] New Board Support and process
In-Reply-To: <CAC78GpfSiOFDHwJ243n+t81ub-Bchs7gWs_16wjrEseiVCLF_A@mail.gmail.com>
References: <CAC78GpfSiOFDHwJ243n+t81ub-Bchs7gWs_16wjrEseiVCLF_A@mail.gmail.com>
Message-ID: <20120207201238.32c4047b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Mon, 6 Feb 2012 16:53:25 -0500,
"J.C. Woltz" <jwoltz@gmail.com> a ?crit :

> I have been maintaining my own branch of buildroot for the Synapse
> Wireless E10.
> http://www.synapse-wireless.com/index.php?mainID=3&subID=10&type=product&prodID=10

Great.

> From a linux point of view, it is an Atmel AT91SAM9G20 based machine.
> I have patches for u-boot, linux, a linux config, and a buildroot
> e10_defconfig.
> Except for the e10_defconfig, the files are located under
> board/synapse/e10/.
> Can I submit these as a patch, or is there a preferred alternative?

This sounds good. However, we would appreciate if there was an effort
to push these patches upstream to the respective project, so that
Buildroot does not need to carry these patches forever.

> I have also updated usb_modeswitch to version 1.2.3 and created a
> package for usb_modeswitch_data which contains udev rules among other
> things.
> 
> I would like to submit these and have them available in future
> releases. That way other users of the E10 have an easier time making
> custom builds.
> 
> Thoughts? Objections? Other?

Sounds good. Submit your patches, we'll review them.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
