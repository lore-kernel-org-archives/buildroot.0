From: Ravi Chemudugunta <chemuduguntar@gmail.com>
Date: Thu, 27 Jan 2011 18:27:17 +1300
Subject: [Buildroot] building for x86
Message-ID: <AANLkTin2T-7uSanijcVE1hNGKz-tYjSMP2r0GhOE5X_M@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I am new here!

I am wanting to compile for an x86 target, and my host system is also
x86, is it advisable to try and use the tool chain that comes with the
distribution? (Debian Lenny).

I tried to do this by selecting external and getting rid of the
prefix, however I get errors like the following:

-gcc command not found, my guess is that buildroot expects the
'arch-platform-' format.

I am assuming it would be easy enough to hack the make files so they
don't affix an '-', however I am wondering whether this is even a good
idea.  For example what happens at the staging to target area when for
e.g. libc needs to be copied?


cheers,

-ravi

-- 
C-x C-s, C-x C-c
