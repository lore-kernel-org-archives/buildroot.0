From: Jomas Nash <jomasnash@gmail.com>
Date: Sat, 11 Dec 2010 13:16:53 +0100
Subject: [Buildroot] How to debug a program in target?
Message-ID: <AANLkTikih3WteMMs9gW1dcW-JsfRGB=xTa2+uPbZi9=S@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to debug a program on the target. (i686)
On the target I type:
# gdb partimage

gdb starts and say (last line):

Reading symbols from /bin/partimage...done
(gdb) _

Then I type run and gdb say:
(gdb) run
Starting program /bin/partimage
..
.. Some copyright messages
..
/root/exec /bin/partimage : No such file or directory.

Can someone tell me what is the problem and
how can I debug my program.

Kind regards,
Jomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101211/e87af44f/attachment.html>
