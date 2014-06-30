From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Jun 2014 23:33:05 +0200
Subject: [Buildroot] [PATCH 0/3] Bump libtirpc/rpcbind,
	add startup script
In-Reply-To: <1404129370-3090-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 30 Jun 2014 13:56:07 +0200")
References: <1404129370-3090-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjguhylq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > This small series of patches update libtirpc and rpcbind to their
 > latest upstream versions, and adds a startup script for rpcbind, which
 > is needed for NFS filesystems to mount properly (this patch is
 > courtesy of Sagaert Johan).

 > The result was tested with a minimal (thread support only) uClibc ARM
 > toolchain, booted under Qemu. I was able to mount a remote NFS
 > filesystem properly.

 > This patch series superseds http://patchwork.ozlabs.org/patch/359802/,
 > http://patchwork.ozlabs.org/patch/359835/, so I will adjust their
 > state in patchwork.

 > Best regards,

 > Thomas

 > Sagaert Johan (1):
 >   rpcbind : add startup script

 > Thomas Petazzoni (2):
 >   libtirpc: bump to 0.2.4
 >   rpcbind: bump to version 0.2.1

Committed series, thanks.

-- 
Bye, Peter Korsgaard
