From: daggs <daggs@gmx.com>
Date: Tue, 22 Nov 2016 07:33:04 +0100
Subject: [Buildroot] root passwd asked for reset every ssh login
Message-ID: <trinity-fb0422c9-2032-4095-bb6b-0656992b88fc-1479796384707@3capp-mailcom-bs04>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

I've created a small image with ssh, I'm trying to ssh into the machine with root account (I've enabled root access for ssh) and I keep getting a msg that tells me the passwd has expired and that I need to replace it. after I replace it the connection is terminated and I need to reconnect.
when I do reconnect and enter the new passwd, I'm greeted with the same passwd change msg.
e.g. I cannot login as root to the machine via ssh.

any ideas how to fix this?

Thanks,
Dagg.
