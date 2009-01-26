From: Mitesh Gupta <guptamitesh@gmail.com>
Date: Mon, 26 Jan 2009 10:37:21 +0530
Subject: [Buildroot] Error encountered when grub is added via make menuconfig
Message-ID: <8ebba8c20901252107k1bd296a6t834faf0fa376e461@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I have encountered following error when adding grub through the buildroot
menu :-

1 out of 2 hunks FAILED -- saving rejects to file netboot/etherboot.h.rej
patching file netboot/fa311.c
patching file netboot/forcedeth.c
patching file netboot/fsys_tftp.c
patching file netboot/grub.h
patching file netboot/i386_byteswap.h
patching file netboot/i386_elf.h
patching file netboot/i386_endian.h
patching file netboot/i386_timer.c
patching file netboot/i82586.c
patching file netboot/if_arp.h
patching file netboot/if_ether.h
patching file netboot/igmp.h
patching file netboot/in.h
patching file netboot/io.h
patching file netboot/ip.h
patching file netboot/isa.h
patching file netboot/lance.c
patching file netboot/latch.h
patching file netboot/linux-asm-io.h
patching file netboot/linux-asm-string.h
patching file netboot/little_bswap.h
patching file netboot/main.c
Reversed (or previously applied) patch detected!  Assume -R? [n] n
Apply anyway? [n] n
Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file netboot/main.c.rej
patching file netboot/mii.h
patching file netboot/misc.c
patching file netboot/natsemi.c
Hunk #13 FAILED at 606.
Hunk #15 FAILED at 646.
2 out of 20 hunks FAILED -- saving rejects to file netboot/natsemi.c.rej
patching file netboot/nfs.h
patching file netboot/ni5010.c
patching file netboot/nic.c
patching file netboot/nic.h
patching file netboot/ns83820.c
patching file netboot/ns8390.c
patching file netboot/osdep.h
patching file netboot/otulip.c
patching file netboot/otulip.h
patching file netboot/pci.c
patching file netboot/pci.h
patching file netboot/pci_ids.h
patching file netboot/pci_io.c
patching file netboot/pcnet32.c
patching file netboot/pic8259.c
patching file netboot/pic8259.h
patching file netboot/pnic.c
patching file netboot/pnic_api.h
patching file netboot/pxe.h
patching file netboot/r8169.c
patching file netboot/rtl8139.c
patching file netboot/segoff.h
patching file netboot/sis900.c
Hunk #42 FAILED at 1075.
Hunk #43 FAILED at 1104.
2 out of 48 hunks FAILED -- saving rejects to file netboot/sis900.c.rej
patching file netboot/sis900.h
patching file netboot/sis900.txt
patching file netboot/sk_g16.c
patching file netboot/sk_g16.h
patching file netboot/smc9000.c
patching file netboot/smc9000.h
patching file netboot/stdint.h
patching file netboot/tftp.h
patching file netboot/tg3.c
patching file netboot/tg3.h
patching file netboot/tiara.c
patching file netboot/timer.c
patching file netboot/timer.h
patching file netboot/tlan.c
patching file netboot/tlan.h
patching file netboot/tulip.c
patching file netboot/tulip.txt
patching file netboot/types.h
patching file netboot/udp.h
patching file netboot/via-rhine.c
patching file netboot/w89c840.c
patching file stage2/disk_io.c
Patch failed!  Please fix grub.400-nic_update2.patch.bz2!
make: *** [/mnt/rootfs/buildroot/buildroot/build_i686/grub-0.97/.unpacked]
Error 1

Kindly help me out

Thanks
Mitesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://lists.busybox.net/pipermail/buildroot/attachments/20090126/8d23340b/attachment.htm 
