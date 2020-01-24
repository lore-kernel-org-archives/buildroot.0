From: a <anushka.parashar@tesco.com>
Date: Fri, 24 Jan 2020 04:55:50 -0600 (CST)
Subject: [Buildroot] vmlinuz on x86_64
Message-ID: <1579863350359-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I'm trying to boot my image using Grub2 on efi mode. I have:
1. bzImage
2. initrd

But I'm not able to boot it. 
*Doubt 1*: Is it because bzImage is not compatible with efi mode? I have
this impression because I haven't seen a grub.cfg with bzImage, when efi
mode is used. 

*Doubt 2*:Even if that's not the case, I'm anyway not able to generate
"vmlinuz", although only vmlinux is getting generated. Is there any way that
I can generate vmlinuz in buidroot?



--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
