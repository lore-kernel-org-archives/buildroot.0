From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 23 Oct 2009 18:37:23 -0400
Subject: [Buildroot] BusyBox or kernel bug?
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901E24D3D@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I just tried to run the BusyBox applet 'showkey' and got the following:

/ # showkey --help
BusyBox v1.15.2 (2009-10-12 19:27:27 MST) multi-call binary

Usage: showkey [-a | -k | -s]

Show keys pressed

Options:
        -a      Display decimal/octal/hex values of the keys
        -k      Display interpreted keycodes (default)
        -s      Display raw scan-codes

/ # showkey
showkey: KDGKBMODE: Invalid argument
/ # uname -r
2.6.31.4

Any ideas if this is a BusyBox or a kernel problem?

Regards,
Hartley
