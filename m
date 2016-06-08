From: gdbabu Krishnan <gdbabu.krishnan@gmail.com>
Date: Wed, 8 Jun 2016 17:23:49 +0530
Subject: [Buildroot] lirc event didn't forward
Message-ID: <CAG7w3y=pnuWQK7NsxqCYAhSeKFvE=J50X5hKyE-U=JsBh5Xa2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

i have working with buildroot for raspberry pi, lircd did not forward event
to uinput, "uinput" present in /dev/ directory

lircd version is  "lircd 0.9.3a" i am using

after startup finish log message from /var/log/message , i did gave irw
command

Jan  1 00:03:15 buildroot lircd: Info: Initial device: /dev/lirc0
Jan  1 00:03:15 buildroot lircd: Info: Initial device: /dev/lirc0
Jan  1 00:03:15 buildroot lircd: Warning: Running as root
Jan  1 00:03:15 buildroot lircd: Info: Using remote: /home/pi/llircd.conf.
Jan  1 00:03:15 buildroot lircd: Notice: lircd(default) ready, using
/var/run/lirc/lircd


after i have given irw command the log message output

Jan  1 00:03:15 buildroot lircd: Info: Initial device: /dev/lirc0
Jan  1 00:03:15 buildroot lircd: Info: Initial device: /dev/lirc0
Jan  1 00:03:15 buildroot lircd: Warning: Running as root
Jan  1 00:03:15 buildroot lircd: Info: Using remote: /home/pi/llircd.conf.
Jan  1 00:03:15 buildroot lircd: Notice: lircd(default) ready, using
/var/run/lirc/lircd
Jan  1 00:04:02 buildroot lircd: Notice: accepted new client on
/var/run/lirc/lircd
Jan  1 00:04:07 buildroot lircd: Info: removed client

is there any problem or i need any other configuration.

thank you,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160608/e8bab082/attachment.html>
