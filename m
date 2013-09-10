From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Sep 2013 22:04:16 +0200
Subject: [Buildroot] [patch] kmod: install depmod to output/host/usr/sbin
In-Reply-To: <522F604C.1000206@gmail.com> (Ryan Coe's message of "Tue, 10 Sep
 2013 11:09:16 -0700")
References: <522F604C.1000206@gmail.com>
Message-ID: <87sixctpdr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Coe <bluemrp9@gmail.com> writes:

 Ryan> After the move to kmod, building the Linux kernel no longer generates
 Ryan> the module dependencies.  The Linux build process is looking for
 Ryan> depmod at $(HOST_DIR)/usr/sbin/depmod.  Host-kmod is installing the
 Ryan> symlink for depmod at $(HOST_DIR)/sbin/depmod. Attached is a patch to
 Ryan> change the location of the depmod symlink for host-kmod.

Thanks. I decided to change the reference in linux.mk instead.

Please consider sending a real git formatted (with Signed-off-by) patch
next time.

-- 
Bye, Peter Korsgaard
