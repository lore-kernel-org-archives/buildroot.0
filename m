From: John Voltz <john.voltz@gmail.com>
Date: Wed, 30 Apr 2008 08:55:35 -0400
Subject: [Buildroot] Buildroot tutorial for Xilinx ML405
In-Reply-To: <0ad501c8aabb$9f580050$ad289e86@LPSC0173W>
References: <0ad501c8aabb$9f580050$ad289e86@LPSC0173W>
Message-ID: <46a136670804300555p5973098dh7f0812df3a389a43@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Very interesting. I've always been interested in FPGAs, but never found a
reason to use them. I've got an Altium Nanoboard that has been gathering
dust on a shelf for years.

So how fast can you run a PowerPC core on an FPGA anyway? Is it possible to
get video out of that board too? What kind of licensing goes along with the
IP cores if you commercialize a design? Are the cores free for tinkering, or
do you have to buy them?

John

On Wed, Apr 30, 2008 at 8:13 AM, Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
wrote:

> Hello all,
> I should have mentioned it earlier, but I've put all my notes online on
> how
> to use buildroot to install and run Linux (kernel 2.6.24) on a Xilinx
> ML405
> target board:
> http://www.gdargaud.net/Hack/Embedded.html
>
> The only things missing are how to finish U-boot, a way to reboot in
> software and how to make a MCS86 kernel ROM file.
>
> Comments and/or corrections are welcome.
> --
> Guillaume Dargaud
> http://www.gdargaud.net/
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080430/f1ff3d8e/attachment.htm 
