From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Apr 2014 17:33:01 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
Message-ID: <5357DD2D.1030702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/04/14 15:42, Lennart Ramberg wrote:
> Hello,
> 
> New and experimenting, I want my target Linux system to reside on a
> Compact Flash,
> such that I can pull it from the host (Buildroot) computer and
> then insert it in my x86 target as an IDE-drive and boot.
> 
> What file(s) should I have in host .../output/images/  and how do I put
> it(them) in the CF?
> I have USB on my host and a USB-CF-adapter and a formatted CF.

 The simplest is probably to use cpio as your rootfs, syslinux as the
bootloader, bzImage as the kernel, and put that on a FAT filesystem.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
