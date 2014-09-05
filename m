From: William Welch <bvwelch@gmail.com>
Date: Fri, 5 Sep 2014 10:10:42 -0500
Subject: [Buildroot] trouble with cross gdb and gdbserver on Microblaze
	little endian
Message-ID: <CAPALihOc7ky+aLeYwfKHLC9C+oT2-9pj-0E3-riTxBFAGjy_1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,

Buildroot runs great on my Xilinx chip -- XC6SLX45. Thank you all for your
great efforts with Buildroot!

But, I am having trouble getting the most basic 'hello world' program
working with cross gdb and gdbserver.

I've tried both BR 2014.05 and 2014.08.  In the host GDB, I am setting
sysroot to the 'staging' sysroot tree, and the messages from GDB look good,
and I can set a breakpoint at main, but when I type continue, the
microblaze system seems to hang.  And I can't interrupt it.

I am using the default buildroot toolchains with default settings except to
select host gdb and the gdb package.

Suggestions welcome.

Thank you,

William
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140905/3d8b076c/attachment.html>
