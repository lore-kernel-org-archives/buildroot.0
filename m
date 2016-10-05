From: Jack <jackzzjack@gmail.com>
Date: Wed, 5 Oct 2016 11:57:26 +0800
Subject: [Buildroot] How can I add extra CFLAGS and LDFLAGS parameters in
	Busybox ?
Message-ID: <CADZ=QZnXFXbkTw-om1Vy+Lk1xdAJsszGgeDavmRUpjBN_WQMhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I tried to add new feature on busybox, and I need to call another API
in busybox toolchain.

How can I add additional CFLAGS and LDFLAGS in busybox?

All I tried is, add "-I XXX" at CONFIG_EXTRA_CFLAGS and "-L XXX -lxxx"
at CONFIG_EXTRA_LDFLAGS in busybox config file without modifying
busybox's Makefile. It shows "XXX/XXX/ld: cannot find -lxxx" message.

I already check "-l" library file in "-L" option PATH.
