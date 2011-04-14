From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 14 Apr 2011 09:50:17 +0200
Subject: [Buildroot] Switching to /dev/ttyX
Message-ID: <BANLkTi=_zF-UOK2PQPxewXb7bPO00mzuAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In /etc/inittab, you have e.g.

tty1::respawn:/sbin/getty 38400 tty1
tty2::respawn:/sbin/getty 38400 tty2
tty3::respawn:/usr/bin/tail -f /var/log/messages

By default I'm connected to the board on a serial line, e.g. /dev/ttyS0

My question is: how can I access the other /dev/tty's?
I tried the chvt command, but that does nothing: the command just
completes but nothing changes on the shell.

'tty' always shows /dev/ttyS0.

Thanks,
Thomas
