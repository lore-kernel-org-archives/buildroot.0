From: Rafael A Barrero <rafa@linux.it>
Date: Tue, 19 Dec 2006 12:10:17 -0800
Subject: [Buildroot] Booting the rootfs ext2 image
Message-ID: <7B808CFD-AB02-4E02-A220-CE241662C366@linux.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi;

Now that I've successfully built a rootfs image that includes my  
custom built kernel, I have a few questions about taking that rootfs  
and actually running it on my dev. system. I've mounted the ext2 fs  
as a loopback device and it looks great, but I'm looking for some  
pointers on getting grub configured for that partition.

I selected grub during the buildroot configuration, but how do I go  
about installing grub so that it boots properly?
Once I copy this image to another disk, how will it be set as bootable?
How do I configure grub within the loopback partition?
What tools do you guys suggest for copying the FS to the new disk?  
rsync? dd?

Thanks!

-Rafael.
