From: David Lambert <dave@lambsys.com>
Date: Thu, 01 Feb 2007 09:04:55 -0600
Subject: [Buildroot] Undefined 'raise' roblem with gcc 4.2 in buildroot
Message-ID: <45C20197.7040602@lambsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am getting the following error when compiling under buildroot using 
the gcc 4.2 compiler:
/buildroot/toolchain_build_arm/gcc-4.2-20061121/gcc/config/arm/lib1funcs.asm:1000: 
undefined reference to `raise'

I have noticed similar posts regarding gcc 4.1.1, but nothing to date 
for 4.2. Am I missing something? Any suggestions?

Best regards,

Dave.
