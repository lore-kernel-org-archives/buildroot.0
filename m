From: Matthew Kerr <mkerr@atspl.com.au>
Date: Mon, 21 Sep 2015 23:08:22 +0000
Subject: [Buildroot] Default configuration for Ka-Ro TX25 module
Message-ID: <6bee8e0798ac4666bc051d88f2064b30@IHM-PORT-E13M01.prdhosting.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi buildroot,

This is my first real Linux based project. I am working with the TX25 module (i.MX257 ARM926EJ-S) from Ka-Ro Electronics. Ka-Ro supplies a development environment (VM), precompiled bootloader, Kernel and root filesystem. They also supply all source files. Due to the age of the product, the VM is rather dated. I would like to be able to use a modern development environment (Ubuntu) but still be able to rebuild the Kernel and rootfs. For now I am happy to use the precompiled bootloader and toolchain; mostly because I had a lot of trouble rebuilding the toolchain and kernel using the Ka-Ro VM, and limited success using Ubuntu 10 (which I figured was similar vintage).

I have been manually creating the rootfs for some time now and decided that there must be an easier way to develop in Linux. I was reading the training notes available on the Free Electrons website and came across Buildroot. On the face of it, it looks like it could make my life much easier. Only I'm a little nervous to use the tool because I know I could spend a week playing with it until I'm convinced I've got it generating something similar to what Ka-Ro has supplied; i.e. their supplied kernel has been configured and I need to work out how to do the same.

So my questions are:

1)      Are you aware of a default configuration which has been created for the TX25 module? Or is there something similar that I should start with?

2)      Is it possible to use the Ka-Ro supplied kernel source (and patches/upgrades)? Should I use it or should I just let Buildroot do its thing and see what happens?

3)      Can I do anything with the Ka-Ro supplied rootfs or should I just let Buildroot generate this for me?

Thanks in advance,

Matthew Kerr | Systems/Software Engineer



T

|

+61 2 6051 7021

M

|

+61 4 0769 4133

S

|

matthew.kerr.ats

E

|

mkerr at atspl.com.au<mailto:mkerr@atspl.com.au>



Australian Target Systems

837 Hope Court | Albury NSW 2640 Australia

W

|

www.atspl.com.au<http://www.atspl.com.au/>



[http://www.atspl.com.au/email-signatures/img/white-australian.png]
DISCLAIMER: This e-mail and any files transmitted with it are intended for the named recipient only. The information contained in this message may be confidential, legally privileged or commercially sensitive. If you are not the intended recipient you must not reproduce or distribute any part of the email, disclose its contents to any other party, or take any action in reliance on it. If you have received this email in error, please contact the sender immediately and delete this message from your computer.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150921/2dd4a0fb/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: image001.png
Type: image/png
Size: 10940 bytes
Desc: image001.png
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150921/2dd4a0fb/attachment.png>
