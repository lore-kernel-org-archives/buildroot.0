From: Joe Pruett <joey@clean.q7.com>
Date: Mon, 18 Dec 2006 10:09:12 -0800 (PST)
Subject: [Buildroot] failure building kernel
Message-ID: <Pine.LNX.4.64.0612181003140.797@q7.q7.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i am using the current svn and trying to get an generic x86 system built 
(still trying to get a vmware system going).  a straight make from scratch 
does build, but doesn't make a kernel.  it looks like the right way to do 
that is to enable the generic x86 support under board support, right?  but 
doing that (and not changing anything else), i am getting:

toolchain/patch-kernel.sh /home/joey/buildroot/build_i686/linux-2.6.19.1 target/device/x86/i386/kernel-patches/
Aborting.  'target/device/x86/i386/kernel-patches/' is not a directory.
make: *** [/home/joey/buildroot/build_i686/linux-2.6.19.1/.patched] Error 1

i haven't been able to track down where the kernel-patches directory 
should get populated from.
