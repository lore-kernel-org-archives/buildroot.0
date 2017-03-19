From: Gunner C. Hooper <Gunnersky2002@gunnerhooper.tk>
Date: Sat, 18 Mar 2017 23:28:23 -0500
Subject: [Buildroot] No mouse or keyboard in TinyX
Message-ID: <ulvpey8gsi79v1kat2yk10ob.1489896832815@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I built TinyX/KDrive with all of its options for a Pentium 133MHz. The server starts, but I'm unable to use the mouse or keyboard. I already tried typing, "X :0 -keybd evdev,, device=/dev/input/event0 -mouse evdev,,device=/dev/input/event1 & twm". My toolchain uses uClibc-ng as a library. I'm still able to switch between TTYs. My system I'm running on is an HP Pavilion 7090 with a 133MHz Pentium MMX and 64MB of RAM. I have a PS/2 Mouse and Keyboard for input and they aren't working in TinyX.

Thanks,
Gunnersky2002.
