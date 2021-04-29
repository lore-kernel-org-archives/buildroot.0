From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 29 Apr 2021 14:39:16 +0200
Subject: [Buildroot] [PATCH 0/4] Support for the Beagle-V platform
In-Reply-To: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
References: <20210429074636.724046-1-thomas.petazzoni@bootlin.com>
Message-ID: <CAK4VdL2T=a7ffUweZC2dV5LTD2JNmP=UxU+2BfJ-L+bVB7Vp=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 29, 2021 at 9:47 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> slight annoyance is that the bootloader
> pre-flashed on the board doesn't work as-is, just due to an incorrect
> fdt_addr_r environment variable value. So reflashing the bootloader
> with what has been built by Buildroot is necessary (but is trivial to
> do using Xmodem).

I would like to try this but I have some questions:
Are you able to still boot the reference Fedora image after flashing
the custom bootloader?
Also, if it is just a matter of updating fdt_addr_r, could it just be
updated in the u-boot environment instead?
And finally, should that be reported as an issue in the starfive
u-boot so maybe they can release another build with that fixed?

Thanks

Erico
