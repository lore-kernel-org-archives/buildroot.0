From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Feb 2012 12:49:16 +0100
Subject: [Buildroot] [PATCH 1/8] linux: use the depmod built in HOST_DIR
In-Reply-To: <20120201091257.636dc684@skate> (Thomas Petazzoni's message of
 "Wed, 1 Feb 2012 09:12:57 +0100")
References: <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <cover.1328038759.git.thomas.petazzoni@free-electrons.com>
 <28c6a15900cdc487752287f9d20e1ad7af0f992a.1328038759.git.thomas.petazzoni@free-electrons.com>
 <87pqdzijxv.fsf@macbook.be.48ers.dk> <20120201091257.636dc684@skate>
Message-ID: <87mx92hiyr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Committed, thanks. Not released to this patch, but is the LZMA stuff
 >> still used/needed?

 Thomas> It has been added by
 Thomas> http://git.buildroot.net/buildroot/commit/target/linux/Makefile.in?id=ea8b1fa6a60705eedc5bd4f405f45c8f531c2126,
 Thomas> which is a bit limited in details on why it was needed. I guess the
 Thomas> goal was to tell the Linux build process to use the lzma utility built
 Thomas> for the host by Buildroot, in case the Linux kernel is built (or the
 Thomas> initramfs) with LZMA compression. But that remains to be verified.

Yes, I know - But I don't see anything using it right away grepping the
kernel. I just wondered if anyone remembered what it was used for (and
if it still is)?

-- 
Bye, Peter Korsgaard
