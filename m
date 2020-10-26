From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Oct 2020 09:29:23 +0100
Subject: [Buildroot] Help adding support for Dragonboard 410c
In-Reply-To: <CABqcFRnBj3jtaOmrzSE0h+hYUrs=CytQDayFrQ=pHyGrYCPN+Q@mail.gmail.com>
References: <CABqcFRnBj3jtaOmrzSE0h+hYUrs=CytQDayFrQ=pHyGrYCPN+Q@mail.gmail.com>
Message-ID: <20201026092923.34e78e5b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mike,

On Mon, 26 Oct 2020 15:46:44 +1300
Mike Frampton <mikeframpo@gmail.com> wrote:

> I have been working on adding support for the Qualcomm Dragonboard
> 410c SBC. I have a working, minimal config.
> 
> My config builds an abootimg kernel image, which can be booted via SD
> card or USB. The patch adds a package for Qualcomm's BSP for the
> device.
> 
> This is my first time using Buildroot (coming from OE previously and
> this is much more my cup of tea :-).

Glad to hear that you found Buildroot useful for your project!

> My patch touches a couple of packages. Should I break each
> package-change into a separate patch before posting here?

Yes, we generally like contributions to be split up in several patches
if they touch several areas/packages.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
