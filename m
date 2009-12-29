From: Stanley <eva2002@gmail.com>
Date: Tue, 29 Dec 2009 14:57:34 +0800
Subject: [Buildroot] Kernel Panic after selecting qt graphic lib
Message-ID: <ed7750810912282257t2208d399q697c974e630610db@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I need some help in getting qt embedded to work.

After completing my configuration for buildroot, i do a make
'make' was successful and the output file (uImage) size was around 7MB.

Halfway through the loading to kernel, I encounter kernel panic. below is
the message I got.

...
NET: Registered protocol family
16
bio: create slab <bio-0> at
0
NET: Registered protocol family
2
IP route cache hash table entries: 1024 (order: 0, 4096
bytes)
TCP established hash table entries: 1024 (order: 1, 8192
bytes)
TCP bind hash table entries: 1024 (order: 0, 4096
bytes)
TCP: Hash tables configured (established 1024 bind
1024)
TCP reno
registered
NetWinder Floating Point Emulator V0.97 (double
precision)
Kernel panic - not syncing: Out of memory and no killable processes...
...


My board is having a 32MB RAM and the uImage size is only 7MB.

How come I still get this message?
How can I resolve this?

On side note, I can use previously, I was using directfb and the uImage size
was around 3.1MB and the kernel can be loaded and use.

Not sure how to attach file to mailing list so I did like normal mail
attachment. Attached is my configuration for both buildroot and linux.

Regards,
Stanley
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091229/eb9b99e3/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_w_qt.config
Type: application/octet-stream
Size: 23681 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091229/eb9b99e3/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux.config
Type: application/octet-stream
Size: 23185 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091229/eb9b99e3/attachment-0003.obj>
