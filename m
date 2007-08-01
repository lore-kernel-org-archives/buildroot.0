From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 1 Aug 2007 08:55:01 +0200
Subject: [Buildroot] lzma kernel patches
Message-ID: <027e01c7d412$65162b40$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

breaks the build, if lzma is not installed on the system.
It is not installed by default on my system (OpenSuSE 10.2).

After checking, I see that building host lzma is a configurable item.

It would be much, much better, if the build system
checked if there was an "lzma" available on the host
and if not, it would build it automatically.

Short term, we could make the kernel headers select building
the lzma host package if the 2.6.21.5 or 2.6.22.1 was selected.

You obviously need it!

Best Regards
Ulf Samuelsson
