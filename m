From: Olivier Singla <olivier.singla@gmail.com>
Date: Sat, 7 Jun 2008 23:23:46 -0400
Subject: [Buildroot] floating point I/O issue (ARM, AT91SAM9260)
Message-ID: <506410170806072023g51592040s533a307e7736bc1e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a strange issue with buildroot for the Atmel AT91SAM9260, which
is related to floating point I/O.
For instance if I have a floating value of 1.961, printf will display
it as 1961000.
Value 1234.567890123 will be displayed as 1234567871.
I also have issue with scanf, when trying to read a floating point.
I built the kernel with floating point emulation.
I suspect the problem is in the C library.
Any idea what's going on ?

Thanks
~Olivier
