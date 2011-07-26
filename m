From: Sam Nazarko <samnazarko@stmteam.com>
Date: Tue, 26 Jul 2011 20:50:21 +0100
Subject: [Buildroot] Can't boot with 2011.05
Message-ID: <000e01cc4bcd$4094e360$c1beaa20$@com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the 2011.05 Buildroot release I've not been able to get a bootable
system even with the simplest of options and I haven't a clue why. In
2011.02 if I was to have some simple options of a i386 build platform
targeting i686 to generate an initramfs system (everything else default,
kernel with i386 defconfig) the system would boot fine in QEMU or VirtualBox
and give me a login prompt. Trying a similar approach on 2011.05 either
chucks a "Adjusting TSC clocksource" and hang or a "ip used greatest stack
depth" and hang. I assume this is not the actual cause of the hang but what
I see before the problem, which I think is to do with mounting the root file
system. 

 

I am wondering what's changed that might be causing this,

 

Thanks

 

Sam

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110726/8cfd8755/attachment-0001.html>
