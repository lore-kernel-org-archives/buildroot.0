From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 24 Feb 2011 12:30:51 +0100
Subject: [Buildroot] Unable to login to buildroot
In-Reply-To: <201102241048.48537.dargaud@lpsc.in2p3.fr>
References: <201102241048.48537.dargaud@lpsc.in2p3.fr>
Message-ID: <AANLkTimvTBzuBY5gpdGmcWDVdMAntznMRPTB6stdK=6F@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/24 Guillaume Dargaud <dargaud@lpsc.in2p3.fr>:
> # Put a getty on the serial port
> ttyUL0::respawn:/sbin/getty -L ttyUL0 115200 vt100 # GENERIC_SERIAL

Try replace this line with:

::respawn:-/bin/sh

And see if that works?
