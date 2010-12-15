From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Dec 2010 11:31:52 +0100
Subject: [Buildroot] [PATCH 03/14] toolchain: add support for external
 toolchain profiles and download
In-Reply-To: <201012141548.38928.vapier@gentoo.org>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<bf29c83b99bbc83aa389f2960819e87b900904ab.1292257643.git.thomas.petazzoni@free-electrons.com>
	<201012141548.38928.vapier@gentoo.org>
Message-ID: <20101215113152.2cf64845@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Dec 2010 15:48:38 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

> this makes it harder to use an external toolchain because you now
> force TARGET_CROSS to always start with /bin/.  before, people could
> easily set the full path to nothing and the prefix to the toolchain
> they want.  since the toolchain is in $PATH, there's no reason to
> force a useless full path to it. -mike

Right, this is a regression from an useful feature, I'll have a look
into this and see what I can come up with.

Regarding this toolchain profile thing, I intended to extend it to
support the Blackfin toolchains, but I'd like to make sure you're not
already working on this, in order to avoid duplication.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 198 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101215/e420d905/attachment.pgp>
