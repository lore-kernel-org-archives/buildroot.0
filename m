From: Paul Jones <paul@pauljones.id.au>
Date: Wed, 25 Aug 2010 20:04:56 +1000
Subject: [Buildroot] mini 2440 config nfs problems
In-Reply-To: <AANLkTikb76LCoPYX93MntAG-dKWerjfBACHkQaOQs2wh@mail.gmail.com>
References: <AANLkTikb76LCoPYX93MntAG-dKWerjfBACHkQaOQs2wh@mail.gmail.com>
Message-ID: <001c01cb443c$f9b3d570$ed1b8050$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I use my mini2440 over nfs without any trouble. I have attached my buildroot
and kernel configs.
Note also that I use the kernel source from the friendlyarm site.
My kernel command line is:
console=ttySAC0 root=/dev/nfs nfsroot=192.168.0.1:/media/root rw ip=dhcp

I have some more info on my website that might help, but some of it is
slightly out of date.
http://pauljones.id.au/blog/

Cheers,
Paul.

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Belisko Marek
> Sent: Wednesday, 25 August 2010 6:48 PM
> To: buildroot at uclibc.org
> Subject: [Buildroot] mini 2440 config nfs problems
> 
> Hi,
> 
> playing with buildroot (2010.08_rc1) to build complete system for my
> mini 2440 board.
> I was able to build kernel and rootfs correctly but when I try to
> mount rootfs over nfs it
> always hangs with :
> 
> Freeing init memory: 120K
> Kernel panic - not syncing: Attempted to kill init!
> 
> Is there anything what I can check? This is not related to some EABI
> tweaking?
> 
> Thanks for replies,
> 
> Marek
-------------- next part --------------
A non-text attachment was scrubbed...
Name: br-config
Type: application/octet-stream
Size: 18566 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100825/f6335d85/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kernel-config
Type: application/octet-stream
Size: 35477 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100825/f6335d85/attachment-0003.obj>
