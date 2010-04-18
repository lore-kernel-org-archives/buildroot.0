From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Apr 2010 22:35:42 +0200
Subject: [Buildroot] There are not device files in dev/ when I extract
	tarball image as root. bug?
In-Reply-To: <20100417053913.528536ef@surf> (Thomas Petazzoni's message of
	"Sat, 17 Apr 2010 05:39:13 +0200")
References: <o2p2134af141004161820q79e42c27s847369b14bfa8c13@mail.gmail.com>
	<20100417053913.528536ef@surf>
Message-ID: <87ljckcxcx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Does it must mknod manually?

 Thomas> No, it's a regression that I caused by the recent filesystem code
 Thomas> cleanup. I'm working on the fix. As an ugly workaround you can add:

 Thomas> TARGET_DEVICE_TABLE=target/device/generic/device_table.txt

 Thomas> at the beginning of fs/common.mk.

And with the new BR2_ROOTFS_DEVICE_TABLE kconfig setting Thomas added.

-- 
Bye, Peter Korsgaard
