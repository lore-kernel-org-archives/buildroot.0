From: Rohit Kumar <rohit.kumar@hitechroboticsystemz.com>
Date: Wed, 16 Apr 2014 11:21:25 +0900
Subject: [Buildroot] buildroot file system: Kernel panic
Message-ID: <CABzetm2iM9vUAQ4GHfiKv_y3HCq_Jek45Pe16MPSZo=CoV+6Cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

i used buildroot to make toolchain and file system.
i used toolchain to compile the kernel source given by processor
manufacturer.
kernel compiled successfully and boots fine but the file system generated
by buildroot doesnt work.

and gives following error:

VFS: Mounted root (nfs filesystem) on device 0:13.
devtmpfs: mounted
Freeing init memory: 480K
Kernel panic - not syncing: Attempted to kill init!
[<c0086408>] (unwind_backtrace+0x0/0xcc) from [<c034af6c>]
(panic+0x54/0x11c)
[<c034af6c>] (panic+0x54/0x11c) from [<c00b2458>] (do_exit+0x5c/0x684)
[<c00b2458>] (do_exit+0x5c/0x684) from [<c00b2d98>]
(do_group_exit+0xac/0xf0)
[<c00b2d98>] (do_group_exit+0xac/0xf0) from [<c00bc130>]
(get_signal_to_deliver+0x3b8/0x410)
[<c00bc130>] (get_signal_to_deliver+0x3b8/0x410) from [<c0083434>]
(do_signal+0x5c/0x5e0)
[<c0083434>] (do_signal+0x5c/0x5e0) from [<c0083e98>]
(do_notify_resume+0x18/0x48)
[<c0083e98>] (do_notify_resume+0x18/0x48) from [<c0080d8c>]
(work_pending+0x1c/0x20)

i dont how to solve it.
file system given by processor manufacturer works fine.

-- 

With Regards,

Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140416/e9630955/attachment.html>
