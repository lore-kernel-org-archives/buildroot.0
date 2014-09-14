From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Sep 2014 12:53:21 +0200
Subject: [Buildroot] Pending "big" patch series
Message-ID: <20140914125321.0d68b842@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Since we're still early in the cycle, it's a good time to look at the
big patch series that are pending, and take a decision on them. I've
compiled a subjective list of the "big" patch series that are pending,
with some comments on each of them. Please add your own comments, and
volunteer to review/test the series. Thanks!

 * Moving to a two stage gcc build (5 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-September/106069.html

   Needs some testing from others.

 * gendoc infra: make it useable for other documents (18 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-September/105678.html

   I'm personally not highly interested in making the gendoc infra
   suitable for other documents than the manual, so I'm not very
   motivated to review this. But maybe other persons are interested,
   especially Samuel or Thomas DS who have followed the gendoc changes?

 * fs/ext2: misc enhancements (4 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-September/105325.html

   Needs review, nothing really complicated here.

 * Introduce libudev (15 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-September/105309.html

   Needs review and testing, but the patch series has gone through
   several iterations already, it should be almost good to go.

 * OpenCV improvement (8 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-August/105208.html

   Needs review.

 * New GFX drivers (4 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-August/105179.html

   Needs review.

 * CMake cleanup (5 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-August/104794.html

   Needs review.

 * ncurses wide support (4 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-August/104715.html

   Needs testing. We really need to get that one merged early, to get
   some autobuilder coverage.

 * toolchain: warn for unsafe library/header paths (12 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-August/104702.html

   I have to respin with a new version.

 * perl: add host variant (6 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-August/104654.html

   We need to get that merged to solve some problems, but on the other
   hand, having to build host-perl as soon as a host Perl module is
   built is annoying.

 * Add libgtk3 and bump webkit to version 2.4.3 (3 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-August/103387.html

   Since the GSoC is over and Hadrien will not continue to work on
   Buildroot, someone needs to adopt those patches. Eric, maybe?

 * packages: rename _OPT into _OPTS (2 patches)
   http://lists.busybox.net/pipermail/buildroot/2014-July/103082.html

   Thomas DS, could you respin this patch series?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
