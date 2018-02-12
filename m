From: AAlex_ <earthquake.de@freenet.de>
Date: Mon, 12 Feb 2018 03:47:23 -0700 (MST)
Subject: [Buildroot] Custom package using buildroot-linux-uclibc-g++
Message-ID: <1518432443635-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
i created a custom package like the libfoo example.
Using $(eval $(generic-package))
The makefile extracts objects from archive and should link them to a so.
Buildroot is using x86_64-buildroot-linux-uclibc-gcc but this doesnt work
(source is c++). 
How can i define that the x86_64-buildroot-linux-uclibc-g++ (which is
availalble in host/bin) is used instead of the
x86_64-buildroot-linux-uclibc-gcc for this package?

Regards Alex



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
