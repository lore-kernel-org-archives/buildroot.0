From: Simon Dawson <spdawson@gmail.com>
Date: Thu, 29 Nov 2012 11:35:18 +0000
Subject: [Buildroot] Buildroot for avr32
In-Reply-To: <20121129113710.63d5676c@skate>
References: <memo.20121129102031.4232H@postmaster+dexdyne.com.cix.co.uk>
 <20121129113710.63d5676c@skate>
Message-ID: <CAHt8ZCN5eB8shsxz+gVz6neYbwVC7kE-O=cT66MCTRQNq6o_qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David, Thomas.

On Thu, 29 Nov 2012 10:20 +0000 (GMT Standard Time), David Collier
> So the question is - should I be able to use "standard buildroot" with an
> AVR32 - or was Atmel adding some magic of their own that has not been
> back-ported to the main trunk?

On 29 November 2012 10:37, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Normally, we have a working AVR32 setup, with certainly old versions of
> uClibc, binutils and gdb. I was told by AVR32 people that upgrading to
> uClibc 0.9.33 should work, but there are a few missing system calls in
> the AVR32 upstream kernel. If you are interested, we can look at this
> together, as I lack AVR32 hardware to dive into this.

I'm using mainline Buildroot for a custom board that is based on the
Atmel NGW100 board, with an ap7000 processor. I haven't had any major
problems; I've had to patch the 3.6.x mainline kernel to get the board
to boot from SD card --- I'm not using any Atmel kernel patches.

I'd be very interested in helping with the migration to uClibc 0.9.33.

Simon.
