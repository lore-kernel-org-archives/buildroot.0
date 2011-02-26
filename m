From: Charles Krinke <charles.krinke@gmail.com>
Date: Sat, 26 Feb 2011 11:13:27 -0800
Subject: [Buildroot] dtc (device tree compiler)
Message-ID: <AANLkTikXg3URUg5XqPJKey5X-0BsgE2gimAPGzF94oUR@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a question about dtc. In the powerpc, a dtc (device tree compiler) is
used to compile a .dts file into a .dtb file which is used by the kernel
(uImage) to boot.

I dont see us compiling the .dts and creating the .dtb in the MPC8323ERDB.

Is there a setting I am missing in buildroot? How does the dtc get invoked
to compile the .dts into a .dtb to go along with the uImage file?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110226/e9801a24/attachment.html>
