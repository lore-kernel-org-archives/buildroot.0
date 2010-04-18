From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Apr 2010 22:36:28 +0200
Subject: [Buildroot] [git commit master] initramfs: trivial fix
	following move to fs
In-Reply-To: <20100417021406.20816aed@surf> (Thomas Petazzoni's message of
	"Sat, 17 Apr 2010 02:14:06 +0200")
References: <20100415115253.9C4B220CC8@busybox.osuosl.org>
	<20100417021406.20816aed@surf>
Message-ID: <87hbn8cxbn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> On Thu, 15 Apr 2010 13:51:33 +0200
 Thomas> Will Wagner <will_wagner@carallon.com> wrote:

 >> define ROOTFS_INITRAMFS_CMD
 >> -	$(SHELL) target/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
 >> +	$(SHELL) fs/initramfs/gen_initramfs_list.sh -u 0 -g 0 $(TARGET_DIR) > $$@
 >> endef

 Thomas> Thanks Will and Peter for fixing the issues encountered following the
 Thomas> filesystem rework. I apologize for having let these issues go through
 Thomas> my testing without being noticed (I think I made most of my testing
 Thomas> *before* moving everything from target/ to fs/).

No problem - Your work is appreciated and it was an easy fix.

-- 
Bye, Peter Korsgaard
