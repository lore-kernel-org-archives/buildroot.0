From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 31 Aug 2007 00:28:16 +0200
Subject: [Buildroot] X11R7 new compilation error
In-Reply-To: <2TCPffdv4D2q.vF6vgtPv@mailout.dof.se>
References: <2TCPffdv4D2q.vF6vgtPv@mailout.dof.se>
Message-ID: <20070830222815.GH11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 30, 2007 at 11:18:48AM +0200, Ulf Samuelsson wrote:
>A good idea would be to
>stop sending html mail...
>
>Best Regards
>Ulf Samuelsson
> ________________ ?rende:	[Buildroot] X11R7 new compilation error F?rfattare:	"pasteur agbanle" <agbanle@gmail.com> Datum:		2007 augusti 30:e 08:16 
>Hello,
>
>i have following error, while compiling x11R7 with fresh copy of buildroot :
>
> /uclinux/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os
>-pipe -I/uclinux/buildroot/build_i586/staging_dir/usr/include
>-I/uclinux/buildroot/build_i586/staging_dir/include
>--sysroot=/uclinux/buildroot/build_i586/staging_dir/ -isysroot
>/uclinux/buildroot/build_i586/staging_dir -mtune=i586 -march=i586
>-DHAVE_CONFIG_H -I. -I../include -I../Xprint -DHAVE_DIX_CONFIG_H
>"-DVENDOR_STRING=\"The X.Org Foundation\"" "-DVENDOR_RELEASE=(((7) *
>10000000) + ((2) * 100000) + ((0) * 1000) + 0)" -Wall -Wpointer-arith
>-Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations
>-Wnested-externs -fno-strict-aliasing -I../include -I../include -I../Xext
>-I../composite -I../damageext -I../xfixes -I../Xi -I../mi -I../miext/shadow
>-I../miext/damage -I../render -I../randr -I../fb -g -O2 -MT atom.lo -MD -MP
>-MF .deps/atom.Tpo -c atom.c  -fPIC -DPIC -o .libs/atom.o
>atom.c:77: error: expected '=', ',', ';', 'asm' or '__attribute__' before
>'Atom'

and another good idea would be to see what atom.c, line 77 tries to do
and where this (probably type or missing include or the like) piece
should come from.

HTH,

>atom.c:153: error: expected '=', ',', ';', 'asm' or '__attribute__' before
>'Bool'
>atom.c:158: error: expected '=', ',', ';', 'asm' or '__attribute__' before
>'char'
>make[2]: *** [atom.lo] Error 1
