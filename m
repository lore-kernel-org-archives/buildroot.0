From: Holger <ltsp@webers-web.net>
Date: Mon, 31 May 2010 20:48:45 +0200
Subject: [Buildroot] host-xlib_libXfont / gzopen64
Message-ID: <1275331725.2815.4.camel@HellDesk.zuhause.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I try to compile a linux dist for my embedde Geode board.
While trying to compile the X-Server the following error ocurred.

>>> host-xlib_libXfont 1.4.1 Building
.....
.....
.....

make[3]: Entering directory
`/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1'
  GEN    doc/fontlib.html
  GEN    doc/fontlib.txt
xmlto: /home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1/./doc/fontlib.xml does not validate (status 127)
xmlto: Fix document syntax or use --skip-validation option
/usr/bin/xmllint: /home/holger/src/buildroot/output/host/usr/lib/libz.so.1: no version information available (required by /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2)
/usr/bin/xmllint: symbol lookup
error: /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2:
undefined symbol: gzopen64
make[3]: *** [doc/fontlib.txt] Fehler 137
make[3]: *** Warte auf noch nicht beendete Prozesse...
xmlto: /home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1/./doc/fontlib.xml does not validate (status 127)
xmlto: Fix document syntax or use --skip-validation option
/usr/bin/xmllint: /home/holger/src/buildroot/output/host/usr/lib/libz.so.1: no version information available (required by /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2)
/usr/bin/xmllint: symbol lookup
error: /home/holger/src/buildroot/output/host/usr/lib/libxml2.so.2:
undefined symbol: gzopen64
make[3]: *** [doc/fontlib.html] Fehler 137
make[3]: Leaving directory
`/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1'
make[2]: *** [all-recursive] Fehler 1
make[2]: Leaving directory
`/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1'
make[1]: *** [all] Fehler 2
make[1]: Leaving directory
`/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1'
make: ***
[/home/holger/src/buildroot/output/build/host-xlib_libXfont-1.4.1/.stamp_built] Fehler 2


Any ideas?

thx Holger
