From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 17 Apr 2011 13:18:07 -0700
Subject: [Buildroot] Understanding how jffs2 boots linux
Message-ID: <BANLkTi=Oqk0sio+rO9-=L8OEd2Sf7Akb3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a not-quite-buildroot question which I think has a simple answer. I
just cannot remember the answer.

I have an MPC8323ERDB project with NOR flash that needs to boot a buildroot
generated rootfs.jffs2 and *somewhere* in the linux kernel, linux parses the
command line with the "mtdparts=" stuff.

I am trying to understand where in the kernel linux parses the mtdparts= and
then how the JFFS2 is setup to boot.

Grepping for CONFIG_MTD_PARTS, JFFS2, mtdparts doesnt get me there. It sends
me all over the kernel in nand stuff and various drivers. I have single
stepped through "setup_command_line" expecting it to be there.

Can someone give me a clue or two that might let me converge my
understanding?

-- 
Charles Krinke

p.s. I did get the BDI-2000 single stepping through the linux kernel using
Eclipse and if anyone is interested in the recipe, I am happy to share some
pointers. Its not that difficult.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110417/7a1fbe17/attachment.html>
