From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Sep 2013 09:08:08 +0200
Subject: [Buildroot] GTK+ for framebuffer?
In-Reply-To: <20130909013956.GA15333@zuhnb712.ap.bm.net>
References: <20130903100905.GA324@zuhnb712.ap.bm.net>
 <20130903133145.370bb2d4@skate>
 <20130904024019.GA875@zuhnb712.ap.bm.net>
 <20130904093510.031f559b@skate>
 <20130905060235.GA15735@zuhnb712.ap.bm.net>
 <20130905091054.51fd4ce0@skate>
 <20130909013956.GA15333@zuhnb712.ap.bm.net>
Message-ID: <20130909090808.7513d104@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Mon, 9 Sep 2013 09:39:56 +0800, Woody Wu wrote:

> I've already have Xfbdev started. Thanks for your help. But I have not
> yet figured out a right way to pass my touchscreen device
> (/dev/input/event0) to Xfbdev.  I tried something like "-mouse
> evdev,,..." and "-mouse tslib,,..." but always got strange warning
> messages.  Maybe you have experience on this.

Here is known-working command line I was using to run Xfbdev under Qemu:

  Xfbdev -keybd evdev,,device=/dev/input/event0 -mouse evdev,,device=/dev/input/event1 &

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
