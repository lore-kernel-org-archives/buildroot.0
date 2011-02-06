From: bruce bushby <bruce.bushby@gmail.com>
Date: Sun, 6 Feb 2011 10:53:01 +0000
Subject: [Buildroot] Package make logs and autoreconf
Message-ID: <AANLkTimo5Mz8_n0NJ3mBr84q0s5DPPdN3RMPrnegkR7j@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I've going through the docs about adding packages and added a few simple
ones that only requires "tar extract, configure & make" .... however one of
my packages requires "autoreconf".

When I run make it stops with:
make: *** No rule to make target `""', needed by `rabbitmq-depends'. Stop.

Is there a log file showing what commands buildroot ran?

If I take the same package on my linux pc and run "tar extract, autoreconf
-i, ./configure ,make" .. it compiles ok. It does require "popt.h" ... but
I'm not seeing this missing dependency in the output...hence wanting to find
some logs?

Thanks
Bruce
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110206/8f745318/attachment.html>
