From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 12 May 2010 15:45:18 +0000 (UTC)
Subject: [Buildroot] tar rootfs compression and copy-image-to don't work
	together?
Message-ID: <hseied$naf$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If I enable building a tar rootfs with gzip compression and configure
buildroot to copy the image to /tftpboot, the tar file that gets
copied to /tftboot isn't compressed.

There is a compressed tar file in output/images, but buildroot copies
the _uncompressed_ tar file to /tftpboot.

Is this a bug, or am I misunderstanding the configuration options?

-- 
Grant Edwards               grant.b.edwards        Yow! I am NOT a nut....
                                  at               
                              gmail.com            
