From: Nicholas Walton <nwalton@aplopteng.com>
Date: Fri, 20 Nov 2009 14:35:28 -0800
Subject: [Buildroot] How do I configure the kernel?
In-Reply-To: <b680c1c10911201430s25dadd6aj8d1c48afaff91445@mail.gmail.com>
References: <he74ti$hbd$1@ger.gmane.org>
	<b680c1c10911201430s25dadd6aj8d1c48afaff91445@mail.gmail.com>
Message-ID: <b680c1c10911201435k3e8e6988pea7dcaaa301ee5d7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 20, 2009 at 2:23 PM, Grant Edwards
<grant.b.edwards@gmail.com> wrote:
> How do you configure the kernel when using buildroot?

make linux26-menuconfig

Other targets, such as Busybox, follow the same convention.

Nicholas

> I've read through the docs and hunted through the "make
> menuconfig" system, but I can't figure out how to configure the
> kernel.
>
> I'm trying to build an ARM Integrator image by following the
> directions at
>
> http://www.linuxfordevices.com/c/a/Linux-For-Devices-Articles/Getting-started-with-an-embedded-Linux-system-emulator/
>
> But my kernel just locks up solid with absolutely no output.
>
> --
> Grant Edwards ? ? ? ? ? ? ? ? ? grante ? ? ? ? ? ? Yow! I always have fun
> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ?at ? ? ? ? ? ? ? because I'm out of my
> ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? visi.com ? ? ? ? ? ?mind!!!
