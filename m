From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Sep 2011 11:54:14 +0200
Subject: [Buildroot] [PATCH] package: add Fluxbox 1.3.1 window manager
In-Reply-To: <4E4A460F.8060501@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 16 Aug 2011 12:27:27 +0200")
References: <20110803192301.4d5c4462@gmail.com>
 <4E49213F.2040401@visionsystems.de>
 <20110815162321.268fd413@gmail.com>
 <4E4A460F.8060501@visionsystems.de>
Message-ID: <8739g6jb21.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 >> I use X.Org (not TinyX), with the following drivers for input :
 >> 
 >> xf86-input-evdev
 >> xf86-input-keyboard
 >> xf86-input-mouse
 >> xf86-input-synaptics (optional, if you have a touchpad)
 >> 
 >> I guess you might need udev support too.

 Yegor> Thanks. That worked. But I had to compile explicit mice support
 Yegor> into kernel. Under Debian it was sufficient to have
 Yegor> /dev/input/eventX devices and corresponding links in
 Yegor> /dev/input/by-path.

Those should be handled by xf86-input-evdev, instead of the legacy
keyboard/mouse.

-- 
Bye, Peter Korsgaard
