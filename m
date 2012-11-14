From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Nov 2012 22:53:40 +0100
Subject: [Buildroot] [PATCH] iso9660 fs: use cpio initrd instead of ext2
In-Reply-To: <1352505249-32028-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sat, 10 Nov 2012 00:54:09 +0100")
References: <1352505249-32028-1-git-send-email-arnout@mind.be>
Message-ID: <87pq3f7swr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> The ext2 initrd is pretty broken, because it requires an additional
 Arnout> root=/dev/ram0 command line parameter, and a /init to mount
 Arnout> devtmps that isn't there in out ext2 rootfs.  So just use a cpio
 Arnout> instead.

 Arnout> Note that there is no check if the kernel supports initramfs or the
 Arnout> selected compression method.

 Arnout> Also removed a bit of dead code in iso9660.mk.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
