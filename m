From: Simon Pasch <fpasch@googlemail.com>
Date: Thu, 23 Aug 2007 11:54:42 +0200
Subject: [Buildroot] Latest Makefile.autotools.in breaks x11r7-compilation.
Message-ID: <f90898420708230254j52eb3de8g258b4fadbabfa9e9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building stops with:
>>> libxcb 1.0 Extracting

/bin/sh: line 1: @tar: command not found
make: *** [/home/fp/buildroot/build_i686/libxcb-1.0/.stamp_extracted] Fehler 127


In the build_i686/libxcb-1.0 directory, there is only the flag-file
.stamp_downloaded
