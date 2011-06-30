From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 30 Jun 2011 18:48:57 +0200
Subject: [Buildroot] tail -f /var/log/messages in inittab
Message-ID: <4E0CA8F9.7080706@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've been staring at the following line in fs/skeleton/etc/inittab:

 > tty3::respawn:/usr/bin/tail -f /var/log/messages

and wondered if it's useful to anybody.
I guess in many embedded systems it is a useless waste of resources.
At least it is on mine, so I wiped it in my port.

Out of curiosity, does anybody really use it?
Or should I send a patch that removes it?

Luca
