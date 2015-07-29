From: Andy Aspell-Clark <andyaspellclark@gmail.com>
Date: Wed, 29 Jul 2015 10:47:27 +0100
Subject: [Buildroot] Grub (or syslinux) on target
Message-ID: <CAHe2UA-NCGYK0+od+FeiVc2dtPxv3g3awx6F_Cevx8LCsHFnBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am developing a distro which will be booted over a network (using
PXEboot). once booted into an initramfs it will auto install a root
filesystem to the (prototype) VPX X86 SBC.

I cannot remove the 'drive' from the embedded system to attach it to my dev
system.

I need the booted distro to include an installer for a bootloader (grub or
syslinux would do).

How do I make buildroot build a bootloader and place it in the target
filesystem instead of in the host filesystem (along with it's dependancies)

-- 
<http://uk.linkedin.com/in/andyaspellclark>

Asimov: "Those people who think they know everything are a great annoyance
to those of us who do."
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150729/eb8e2e42/attachment.html>
