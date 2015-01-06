From: Williams Jr., Ernest L. <ernesto@slac.stanford.edu>
Date: Tue, 6 Jan 2015 20:39:42 +0000
Subject: [Buildroot] Newbie: building hdf5 for x86 32-bit --configure:
 error: C compiler cannot create executables
Message-ID: <9a6aa392add8416b984a427fd3d4d538@exch13-mail05.win.slac.stanford.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Another Newbie question.

I am now trying to build the hdf5 package for a 32-bit target.

I can't seem to track down this error:

checking for i686-buildroot-linux-uclibc-gcc... /afs/slac.stanford.edu/g/lcls/vol9/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/../host/linux-x86_64/i686-linux/usr/bin/ccache /afs/slac.stanford.edu/g/lcls/vol9/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/../host/linux-x86_64/i686-linux/usr/bin/i686-buildroot-linux-uclibc-gcc
checking whether the C compiler works... no
configure: error: in `/afs/slac/g/lcls/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/output/build/hdf5-1.8.14':
configure: error: C compiler cannot create executables
See `config.log' for more details
make: *** [/afs/slac/g/lcls/package/linuxRT/buildroot-2014.11/buildroot-uclibc-x86/output/build/hdf5-1.8.14/.stamp_configured] Error 77


Thanks in advance for any guidance.

Cheers,
Ernesto
