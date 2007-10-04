From: Kuten Ivan <ivan.kuten@promwad.com>
Date: Thu, 04 Oct 2007 10:45:10 -0100
Subject: [Buildroot] tinyx in buildroot
In-Reply-To: <488259.57014.qm@web94307.mail.in2.yahoo.com>
References: <488259.57014.qm@web94307.mail.in2.yahoo.com>
Message-ID: <4704D246.7010106@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

saravanan wrote:
> hi,
> 
>     i had  cross compiled buildroot with tinyX support for my MIPS developement board.now i need a windows manager to be ported. i tried compiling matchbox with tinyX,but i was not successfull. the following is the error i got:
> 
> /home/linuxau1200/oldbuildroot/buildingnew/buildroot/build_mipsel/xc-011010/exports/lib  -lX11 -lXext      -L/usr/local/lib -L/usr/X11R6/lib -lXcursor -lXrender -lX11
> /home/linuxau1200/oldbuildroot/buildingnew/buildroot/build_mipsel/staging_dir/lib/gcc/mipsel-linux-uclibc/3.4.2/../../../../mipsel-linux-uclibc/bin/ld: skipping incompatible /usr/X11R6/lib/libXcursor.so when searching for -lXcursor
> /home/linuxau1200/oldbuildroot/buildingnew/buildroot/build_mipsel/staging_dir/lib/gcc/mipsel-linux-uclibc/3.4.2/../../../../mipsel-linux-uclibc/bin/ld: skipping incompatible /usr/X11R6/lib/libXcursor.a when searching for -lXcursor
> /home/linuxau1200/oldbuildroot/buildingnew/buildroot/build_mipsel/staging_dir/lib/gcc/mipsel-linux-uclibc/3.4.2/../../../../mipsel-linux-uclibc/bin/ld: cannot find -lXcursor
> collect2: ld returned 1 exit status
> make[2]: *** [matchbox-window-manager] Error 1
> make[2]: Leaving directory `/home/linuxau1200/matchbox/matchbox-window-manager-1.2/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/home/linuxau1200/matchbox/matchbox-window-manager-1.2'
> make: *** [all] Error 2
> linux:/home/linuxau1200/matchbox/matchbox-window-manager-1.2 #                 .
> 
> it links to the libXcursor library of the host system(x86 processor). i searched in the tinyX compiled package and could not find any library like this.
> 
> can anyone provide me any solutions or suggestions for this ?
> 
> thanks in advance,
> 
> saravanan.

AFAIK, all x11/xorg/tinyX stuff is very experimental - and do not
compile without hand-work tweaks.

Best regards,
Ivan

--------------------------------
> Embedded Linux engineer,
> Promwad Company: http://www.promwad.com/
> Homepage : http://www.ivankuten.com/
> --------------------------------
