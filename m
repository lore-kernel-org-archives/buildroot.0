From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 06 Jun 2011 11:33:57 +0200
Subject: [Buildroot] gstreamer: unexpected reloc type 0x0
Message-ID: <4DEC9F05.1090604@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i get this error, if i start gstreamer:

# gst-inspect
/usr/bin/gst-inspect-0.10: error while loading shared libraries: 
/usr/lib/libgmodule-2.0.so.0: unexpected reloc type 0x03
# gst-launch
/usr/bin/gst-launch-0.10: error while loading shared libraries: 
/usr/lib/libgmodule-2.0.so.0: unexpected reloc type 0x03

Compiler: codesourcery 2009q1

What is the problem?

Regards,

Klaus
