From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2016 15:41:28 +0100
Subject: [Buildroot] New autobuild.b.o feature: build duration
Message-ID: <20161203154128.35314298@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

After having recently added the C library, sub-architecture and static
vs. dynamic information to autobuild.b.o, I've added today yet another
column: the build duration.

For me, the key advantage of this column is to be able to more easily
identify one of the shortest build (in duration) that allows to
reproduce a given autobuilder failure.

Of course, the duration information is a bit relative, as it depends on
the speed of the autobuilder machine on which the build took place. But
it should give some rough idea of whether a very long build was needed
before reaching the failure or not.

Hopefully this will be useful for others as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
