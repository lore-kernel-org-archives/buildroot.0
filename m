From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 21:33:41 +0200
Subject: [Buildroot] [PATCH 1/1] Add a filesystem option so a device can
 be booted over NFS.
In-Reply-To: <1405430476-29925-1-git-send-email-sagaert.johan@skynet.be>
References: <1405430476-29925-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <20140715213341.51a462ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sagaert Johan,

On Tue, 15 Jul 2014 15:21:16 +0200, Sagaert Johan wrote:
> 
> This options allows specifying a directory where the target rootfs is
> copied to so it can be used to boot a device over NFS.
> 
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>

How to boot from NFS is explained at
http://buildroot.org/downloads/manual/manual.html#_nfs_boot, and the
solution you propose requires root privileges to extract the tarball
image, which is not acceptable as Buildroot doesn't run as root.

Therefore, I'll have to mark your patch as Rejected in our patch
tracking system. Do not hesitate to let us know if you disagree and see
a better way of doing things.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
