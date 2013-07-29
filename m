From: Paul B. Henson <henson@acm.org>
Date: Mon, 29 Jul 2013 11:20:29 -0700
Subject: [Buildroot] [PATCH] mtd: add option to build mkfs.ubifs for
 target
In-Reply-To: <CAAXf6LU_GeZ+MNTiJMKuKVTmLROhj-BtUuinirFF6jS2kTVXVA@mail.gmail.com>
References: <20130729021746.EF4355C127@zaphod.pbhware.com>
 <CAAXf6LU_GeZ+MNTiJMKuKVTmLROhj-BtUuinirFF6jS2kTVXVA@mail.gmail.com>
Message-ID: <20130729182029.GC30160@bender.unx.csupomona.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 29, 2013 at 02:47:34PM +0200, Thomas De Schampheleire wrote:

> I find it a bit overkill to use $(addprefix) for just one binary. My
> suggestion would be to simply:
> MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS)          += mkfs.ubifs/mkfs.ubifs

I must confess my patch was based on observation and duplication, not
on a deep understanding of internals ;). I'll make this change and
resubmit the patch, thanks for the feedback.
