From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 11 Jun 2008 23:30:42 +0200
Subject: [Buildroot] kernel image size depends on toolchain?
In-Reply-To: <484F8F05.2040105@gin.de>
References: <484F8157.2050902@gin.de> <87hcc0pfrr.fsf@macbook.be.48ers.dk>
	<484F8F05.2040105@gin.de>
Message-ID: <200806112330.43075.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas Kuehn, 11.06.2008:
> Is there a chance that something in the uclibc like the LARGEFILESUPPORT 
> creates some static or incompressable data block?

The kernel is not being linked against uClibc, so there is no influence.

Markus
