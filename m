From: Goetz Bock <bock@blacknet.de>
Date: Mon, 20 Nov 2006 16:38:44 +0100
Subject: [Buildroot] Multiple cpio archives
Message-ID: <20061120153844.GF3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear list,

I fear this might be somewhat oftoppic, but I'll ask anyway.

Some comments on the kernelml (from quite some time ago) and the
changelogs of e.g. syslinux suggest that it might be possible to append
multiple cpio files as initrd to a linux kernel.

I would like to use this for my initramfs to seperate the modules from
the rest of my system.

But it simply does not work. I'm using linux 2.6.17-2-486 (from debian)
and a buidlroot based root.i586.cpio.gz. As bootloader I'm using
pxelinux. The two images are loaded, but only the root image is
extracted.

Any ideas?

BTW: I think there was some mini distribution that did exatly what i try
     to do, but I can't find it anymore (should have bookmarked it :-( )
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
