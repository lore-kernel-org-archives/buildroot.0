From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Wed, 05 Oct 2011 15:31:29 +0200
Subject: [Buildroot] [PATCH] gdb: bump to 7.3.1
In-Reply-To: <878vozr32n.fsf@macbook.be.48ers.dk>
References: <4E856673.8020205@visionsystems.de>
 <20110930222606.2ed76af5@skate> <201110012324.54139.arnout@mind.be>
 <CAGm1_ktCdcObbXCYQryUOU5h=Sxpe+aE598NuLXU4HCQ9jCxrQ@mail.gmail.com>
 <878vozr32n.fsf@macbook.be.48ers.dk>
Message-ID: <4E8C5C31.5040703@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 05.10.2011 15:16, schrieb Peter Korsgaard:
>>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
> 
>  Yegor> Thanks for comments. I'll rework the patch next week. By the way
>  Yegor> shouldn't we get rid of 6.8 due to this issue:
>  Yegor> http://comments.gmane.org/gmane.comp.gdb.devel/30648. That was the
>  Yegor> reason for trying 7.x version.
> 
> Yes, probably. It seems we'll need to keep 6.6 around for bfin though.

I've sent a proper patch using git (there is still plenty to learn about). 

Have you looked at http://www.gnu.org/s/gdb/ 7.3 release notes?

" ia64 HP-UX (native) and Blackfin (target) support
  GDBserver support for PowerPC LynxOS, i686 LynxOS, and Blackfin Linux "

Can some one with blackfin test this? If it is working, we could remove the dependence on !blfn.

Best regards,
Yegor
