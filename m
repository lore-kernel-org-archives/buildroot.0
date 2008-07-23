From: hartleys <hartleys@visionengravers.com>
Date: Wed, 23 Jul 2008 18:16:16 -0400
Subject: [Buildroot] Logread output
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190948128E@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Is there any way (other than modifying the source) to get logread to not
output the timestamp information?

For instance instead of showing:

Jul 23 09:10:05 (none) daemon.info init: init: starting pid 408, tty
'/dev/ttyAM2': '-/bin/sh'

I just want it to output:

init: starting pid 408, tty '/dev/ttyAM2': '-/bin/sh'

Thanks,
Hartley
