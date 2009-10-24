From: Mark Constable <markc@renta.net>
Date: Sat, 24 Oct 2009 14:56:49 +1000
Subject: [Buildroot] Autobuild server
Message-ID: <4AE28911.2070501@renta.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'd like to set up an x86_64 machine to auto build buildroot,
busybox and uclibc from Git every night for x86_64, i686, arm
(v4te and v5te), and maybe mipsel and i486, but I would need
some help and suggestions how best to go about including busybox
and uclibc (from Git) into the buildroot environment.

Is anyone else already doing something like this?

Would this be useful in general?

I intend to host and provide any resulting tarballs for download,
not just test the builds.

--markc
