From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 1 Nov 2019 18:45:26 +0100
Subject: [Buildroot] Raspberrypi4: Unable to run Weston?
In-Reply-To: <20191101151214.GA3133@scaer>
References: <d6e80828979625a2bb2689e73cae1fed84fdc10c.camel@r7-engineering.com>
 <1e479c8b712075c07fcf9b78e687b522c7efd159.camel@r7-engineering.com>
 <20191101151214.GA3133@scaer>
Message-ID: <20191101184526.57b71fa4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Fri, 1 Nov 2019 16:12:14 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Rostislav, All,
>
> On 2019-10-31 20:01 +0100, Rostislav Lisovy spake thusly:
> > Is it possible to use Mesa3D / Gallium VC4 driver with RPi4?
>
> The raspberrypi4 does not use VC4, but VC6.

Yann is right with the VC4 vs. VC6 RPi3/RPi4 version...

Gentoo (gentoo-on-rpi-64bit, see [1]) claims to have a running
64-Bit image with VC6 support for Rpi4 using mesa (and
vc4-fkms-v3d instead of vc4-kms-v3d)...

Regards,
Peter

[1] https://github.com/sakaki-/gentoo-on-rpi-64bit

>
> Regards,
> Yann E. MORIN.
>
