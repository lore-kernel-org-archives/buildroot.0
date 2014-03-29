From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 10:40:45 +0100
Subject: [Buildroot] Major patch sets to review and test
Message-ID: <20140329104045.13985ff3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

As you've noticed, I've started committing a few patches. Peter is on
business trip for a week, so I'm temporarily taking over the
maintenance of Buildroot, with Peter's agreement of course.

I'd like to take advantage of this to make some progress on at least a
few of the major patch series that are sitting in patchwork, and
therefore I would like people to comment/test/review those patch series.

The patch series I would like to have a look at are:

 * The Python 2 / Python 3 fixes from Samuel. This series is
   particularly important because it's needed to fix a number of
   recurrent autobuilder failures. I'd especially appreciate to get some
   reviews from Arnout on this series.

   http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/79108/

 * The virtual package infrastructure from Yann.

   http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/79441/

 * The download infrastructure changes from Yann.

   http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/79474/

Of course, reviews on other patches are also appreciated, but I'd like
to put the emphasis on those three series. I know they are not the
easiest ones, but we need to get through them.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
