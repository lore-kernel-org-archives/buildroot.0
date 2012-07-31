From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 23:57:54 +0200
Subject: [Buildroot] Approaching 2012.08-rc1, and beyond
Message-ID: <20120731235754.56bc0b11@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Within a few minutes, we will be August, 1st. I am therefore planning
on releasing 2012.08-rc1 tomorrow evening in order to comply with our
traditional release schedule.

Even though I have tried to aggressively merge many patches in order to
reduce the backlog, I unfortunately haven't been able to merge as much
things as I wanted. Some packages (like gpsd) have caused various
problems that have consumed quite some time to solve. So things like the
Lua improvements, MIPS architecture support cleanups, gettext
conversion to autotools-package and related cleanups, many new
packages, etc. will have to wait until the next release.

As usual, as soon as 2012.08-rc1 is released, we will have to work in
two directions:

 * Continue the work on the 2012.08 release. I mostly will be interested
   in build fixes (please help by proposing patches to fix build issues
   found through http://autobuild.buildroot.org). I will however also
   be accepting documentation improvements and addition of license
   metadata to package .mk files since those have no chance of breaking
   the build. This direction is obviously the most important one.

 * Continue to reduce the backlog by merging new features and major
   changes in the 'next' branch, that will lend into the 'master'
   branch as soon as 2012.08 is released.

Thanks for the contribution of everyone!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
