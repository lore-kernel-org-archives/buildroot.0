From: hartleys <hartleys@visionengravers.com>
Date: Tue, 24 Jun 2008 11:59:43 -0400
Subject: [Buildroot] FW:  Problem: Unable to select packages
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19091D7455@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

This problem still exists with svn 22489.

Trying to select any package in the "Graphics libraries and applications
(grpahic/text)  -->" sub-menu just moves the selection to "*** --> (May
be broken in busybox) ***"

I think this started when the new config stuff was merged.

Any ideas?

Thanks,
Hartley

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of hartleys
Sent: Friday, June 20, 2008 1:41 PM
To: buildroot at uclibc.org
Subject: [Buildroot] Problem: Unable to select packages

Hello all,

In the latest svn (22460) I am unable to select packages under
BR2_GRAPHIC_SUPPORT.

Once you go into the "Graphic libraries and applications (graphic/text)
--->" menu, trying to select anything will highlight "** -> (may be
broken in busybox) ***".

I also tried a new svn co with the same results.

Hartley
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
