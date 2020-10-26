From: Mike Frampton <mikeframpo@gmail.com>
Date: Mon, 26 Oct 2020 15:46:44 +1300
Subject: [Buildroot] Help adding support for Dragonboard 410c
Message-ID: <CABqcFRnBj3jtaOmrzSE0h+hYUrs=CytQDayFrQ=pHyGrYCPN+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have been working on adding support for the Qualcomm Dragonboard
410c SBC. I have a working, minimal config.

My config builds an abootimg kernel image, which can be booted via SD
card or USB. The patch adds a package for Qualcomm's BSP for the
device.

This is my first time using Buildroot (coming from OE previously and
this is much more my cup of tea :-).

My patch touches a couple of packages. Should I break each
package-change into a separate patch before posting here?

Cheers,
--Mike Frampton
