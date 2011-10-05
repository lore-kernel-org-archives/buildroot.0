From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 15:16:32 +0200
Subject: [Buildroot] [PATCH] gdb: bump to 7.3.1
In-Reply-To: <CAGm1_ktCdcObbXCYQryUOU5h=Sxpe+aE598NuLXU4HCQ9jCxrQ@mail.gmail.com>
 (Yegor Yefremov's message of "Sun, 2 Oct 2011 00:35:03 +0200")
References: <4E856673.8020205@visionsystems.de>
 <20110930222606.2ed76af5@skate> <201110012324.54139.arnout@mind.be>
 <CAGm1_ktCdcObbXCYQryUOU5h=Sxpe+aE598NuLXU4HCQ9jCxrQ@mail.gmail.com>
Message-ID: <878vozr32n.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 Yegor> Thanks for comments. I'll rework the patch next week. By the way
 Yegor> shouldn't we get rid of 6.8 due to this issue:
 Yegor> http://comments.gmane.org/gmane.comp.gdb.devel/30648. That was the
 Yegor> reason for trying 7.x version.

Yes, probably. It seems we'll need to keep 6.6 around for bfin though.

-- 
Bye, Peter Korsgaard
