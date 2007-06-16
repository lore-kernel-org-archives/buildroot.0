From: Mats Erik Andersson <mats.andersson64@comhem.se>
Date: Sat, 16 Jun 2007 19:43:49 +0200
Subject: [Buildroot] Toolchain for i386 with floating point emulation
In-Reply-To: <4673E35E.70905@elaxys.com.br>
References: <4673E35E.70905@elaxys.com.br>
Message-ID: <1182015829.13620.3.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

l?r 2007-06-16 klockan 10:19 -0300 skrev Claudio Leonel:
> Hi
> 
> I need to build a buildroot toolchain for the Vortex86SX chip.
> This is a new low power chip from DMP which was shown in the
> latest COMPUTEX (www.vortex86sx.com).
> This chip is a 486 without the floating point coprocessor.
> 
> I didn't find any options in buildroot to build a toolchain for
> the i386 architecture with floating point emulation.

Run

$ make uclibc-menuconfig

    Target Architecture Features and Options  -->
      Enable floating point support
        Target CPU has a floating point unit

Switch the latter tick off!

Good luck!   Mats E A 
