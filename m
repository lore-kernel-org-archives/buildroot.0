From: Julien Vermillard <jvermillard@archean.fr>
Date: Wed, 17 Jan 2007 13:49:14 +0100
Subject: [Buildroot] Fontconfig
Message-ID: <1169038154.6702.5.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Look like fontconfig got a problem :

make[4]: Entering directory
`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2/fc-case'
gcc  -Os -pipe     -o fc-case  fc-case.o  
fc-case.o: In function `main':
fc-case.c:(.text+0x3e6): undefined reference to `__ctype_b'
collect2: ld returned 1 exit status
make[4]: *** [fc-case] Error 1
make[4]: Leaving directory
`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2/fc-case'
make[3]: *** [all] Error 2
make[3]: Leaving directory
`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2/fc-case'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2'
make: *** 
[/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2/.compiled] Error 2

Any idea ?

Julien
