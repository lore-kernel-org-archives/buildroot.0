From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Apr 2012 15:44:32 +0200
Subject: [Buildroot] [toolchain] Linaro 2012.03 issue
In-Reply-To: <4F8D7012.6010901@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 17 Apr 2012 15:28:50 +0200")
References: <4F8D7012.6010901@visionsystems.de>
Message-ID: <87obqqjwvz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

 Yegor> Has someone used Linaro 2012.03 for C++ based packages?
 Yegor> Everything compiles so far, but libstdc++.so.6 and libgcc_s.so.1
 Yegor> are missing on target. Following run-time error occurs:
 Yegor> Populating using udev: /lib/udev/udevd: error while loading
 Yegor> shared libraries: libgcc_s.so.1: cannot open shared object file:
 Yegor> No such file or directory

Yes, it was pointed out by Shawn Ferris a few days ago as well:

http://lists.busybox.net/pipermail/buildroot/2012-April/052549.html

I'm waiting for the 2012.04 release to see if this was just a bug in
2012.03 or if we need to adjust our ext-toolchain support to handle it.

-- 
Bye, Peter Korsgaard
