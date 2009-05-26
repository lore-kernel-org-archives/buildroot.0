From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 May 2009 22:51:31 +0200
Subject: [Buildroot] busybox.mk
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901862B06@mi8nycmail19.Mi8.com>
	(H. Hartley Sweeten's message of "Tue\,
	26 May 2009 14\:44\:16 -0400")
References: <BD79186B4FD85F4B8E60E381CAEE190901862B06@mi8nycmail19.Mi8.com>
Message-ID: <878wkja8q4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "H" == H Hartley Sweeten <hartleys@visionengravers.com> writes:

 H> Hello all,
 H> Commit a7ed91a957000fc16fd85720c70fb2e4561e1433 modified
 H> busybox.mk as follows:

 H> -       $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 H> +q      $(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 H>                 CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 H>                 ARCH=$(KERNEL_ARCH) \
 H>                 EXTRA_CFLAGS="$(TARGET_CFLAGS)" -C $(BUSYBOX_DIR)

 H> Is the 'q' a typo?  If not what does it do?

Argh, a typo ofcourse - fixed.

Thanks for letting me know - Strangely it still works here with that
'q'.

-- 
Bye, Peter Korsgaard
