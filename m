From: =?koi8-r?B?89TB0sPF1yDl18fFzsnK?= <slayer-gurgen@yandex.ru>
Date: Thu, 02 Dec 2010 08:53:49 +0300
Subject: [Buildroot] ifplugd
Message-ID: <113211291269229@web79.yandex.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

When i try to build this package for target system, i get this error (at configuration time).

..
checking for strspn... yes
checking pkg-config is at least version 0.9.0... yes
checking for LIBDAEMON... yes
configure: error: missing --with-initdir=DIR
..

I think that this is little mistake in related Makefile, but i don't know that means option --with-initdir in this case.

Best regards!
Evgeny Startsev.
