From: Drew Cohan <drewcohan@gmail.com>
Date: Thu, 10 Aug 2006 17:07:38 -0400
Subject: [Buildroot] Packages that error out during build
In-Reply-To: <20060810175113.GA20615@codepoet.org>
References: <bf61e79a0608100739p4899b15brb988f9063f044978@mail.gmail.com>
	<20060810175113.GA20615@codepoet.org>
Message-ID: <bf61e79a0608101407y34638fe7tb6891a3fd990e3e3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And the last one I tried using buildroot 15797, Xorg:

cc -I../../../exports/include -o xkbcomp  xkbcomp.o xkbscan.o expr.o
vmod.o indicators.o misc.o alias.o 		 keymap.o keycodes.o keytypes.o
compat.o action.o 		 symbols.o geometry.o xkbpath.o listing.o 		
xkbparse.o parseutils.o utils.o  -L/usr/X11R6/lib -lxkbfile -lX11
/usr/bin/ld: cannot find -lxkbfile
collect2: ld returned 1 exit status
make[6]: *** [xkbcomp] Error 1
make[6]: Leaving directory
`/home/user/buildroot/build_i686/xc/programs/xkbcomp/cross'
make[5]: *** [all] Error 2
make[5]: Leaving directory `/home/user/buildroot/build_i686/xc/programs/xkbcomp'
make[4]: *** [all] Error 2
make[4]: Leaving directory `/home/user/buildroot/build_i686/xc/programs'
make[3]: *** [all] Error 2
make[3]: Leaving directory `/home/user/buildroot/build_i686/xc'
make[2]: *** [World] Error 2
make[2]: Leaving directory `/home/user/buildroot/build_i686/xc'
make[1]: *** [World] Error 2
make[1]: Leaving directory `/home/user/buildroot/build_i686/xc'
make: *** [/home/user/buildroot/build_i686/xc/programs/Xserver/Xorg] Error 2
