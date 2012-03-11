From: Stephan Hoffmann <sho@relinux.de>
Date: Sun, 11 Mar 2012 19:26:37 +0100
Subject: [Buildroot] Toolchain for Microblaze
Message-ID: <4F5CEE5D.30504@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I just found on the gcc web site (
http://gcc.gnu.org/gcc-4.6/changes.html ) the following message:
>
>
>       MicroBlaze
>
>     * Support has been added for the Xilinx MicroBlaze softcore
>       processor (microblaze-elf) embedded target. This configurable
>       processor is supported on several Xilinx Spartan and Virtex FPGAs.
>
This sounds like good news. Maybe we can get rid of the prebuild Xilinx
Toolchain.

Unfortunatelly, I don't have any experience in building toolchains. A
first try building it as internal toolchain with almost standard
settings ended with an aclocal error;-(

Can anyone try building it?

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120311/b7a633ca/attachment.html>
