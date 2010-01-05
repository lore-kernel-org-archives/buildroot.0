From: Stanley <eva2002@gmail.com>
Date: Tue, 5 Jan 2010 14:44:47 +0800
Subject: [Buildroot] QT, minicom, buildroot
Message-ID: <ed7750811001042244l4097489ama111569d280906a3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I am working on a project using arm9 board with an touchscreen. I
successfully built and run qt with tslib and am using "minicom" program as
hyperterminal to communicate with the board. all went well until I discover
that the qt widget is not getting any info from minicom terminal.

The lineedit (ie textbox) widget is in focus. but whatever i typed on the
laptop keyboard (connected via serial port) is not shown on the textbox
instead it is treated as entry on the linux kernel itself.

example:
- lineedit is in focus-> typed abc followed by enter
result: nothing shown on lineedit

- close program-> linux response:- sh: abc not found

Anyone know how to build the kernel using buildroot to allow hyperterminal
entry to be treated as entry to the linedit widget of QT or any other way to
get it working?

attached is my config for buildroot and linux just in case you need any
reference. I am using Minicom version 2.2

Regards,
Stanley
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100105/de9fab5a/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_w_qt.config
Type: application/octet-stream
Size: 23469 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100105/de9fab5a/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: linux.config
Type: application/octet-stream
Size: 36620 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100105/de9fab5a/attachment-0003.obj>
