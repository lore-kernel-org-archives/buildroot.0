From: Stephan Hoffmann <sho@relinux.de>
Date: Thu, 11 Oct 2012 10:19:34 +0200
Subject: [Buildroot] make legal-info fails when override is active
Message-ID: <50768116.4000506@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

in my setup using the override srcdir feature for the kernel make
legal-info fails.

> make legal-info
> >>>   Collecting legal info
> make: *** No rule to make target `linux-extract', needed by
> `linux-legal-info'.  Stop.

Tested with actual git head (526badc94)

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121011/573c0fce/attachment.ksh>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: local.mk
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121011/573c0fce/attachment-0001.ksh>
