From: Lane Brooks <lane@brooks.nu>
Date: Wed, 26 Dec 2007 00:23:30 -0700
Subject: [Buildroot] x11r7 modules not installing
Message-ID: <47720172.3010200@brooks.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am new to buildroot, but so far it is great.

I am trying to build x11r7, but modules do not seem to get installed 
correctly.  It seems the build script is calling 'make install-exec', 
which does not install the modules onto the target.  Am I doing 
something wrong?  Anyone know why my x11 modules are not getting installed?

Thanks,
Lane Brooks
