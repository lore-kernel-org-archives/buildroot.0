From: Makis Tsimaras <tsigian@gmail.com>
Date: Thu, 11 Feb 2010 16:58:07 +0200
Subject: [Buildroot] asterisk works in buildroot?
Message-ID: <e42c80a1002110658y6dd628bbg419a1062d8f8019@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello everyone.

I try to build an asterisk system for an Alixd1 board with Buildroot but i
can't so far.

I read the docs and i tried to include the asterisk-1.4.29 into the building
by following the instructions.
It actually worked and when i copied the image into a CF card, and boot the
Alixd1 board with..., i could see the asterisk binary in the /sbin
directory.

The problem is while i could start it and also connect to the asterisk CLI
prompt with "asterisk -rvv",... i couldn't see the service at all with the
"netstat" command from inside the Alixd1 board,  and also with "nmap" from
an external host,....while at the same time i could scan and use other
service daemons like SSHD and VSFTPD.

Maybe i miss something but this is where im now.

My question is that is the "depends on BROKEN" line in the
"package/multimedia/asterisk/Config.in" means that asterisk cannot compile
and work with Buildroot at all?


Is there anyone who successfully compiled asterisk with Buildroot?
I would appreciate any help please.
Thank you anyway.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100211/946c00cd/attachment.htm>
