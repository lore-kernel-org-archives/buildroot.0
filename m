From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 17 Apr 2012 15:28:50 +0200
Subject: [Buildroot] [toolchain] Linaro 2012.03 issue
Message-ID: <4F8D7012.6010901@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has someone used Linaro 2012.03 for C++ based packages? Everything compiles so far, but libstdc++.so.6 and libgcc_s.so.1 are missing on target. Following run-time error occurs:

Populating  using udev: /lib/udev/udevd: error while loading shared libraries: libgcc_s.so.1: cannot open shared object file: No such file or directory
FAIL
done  

Linaro 2012.02 is working and installing properly.

Yegor
