From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Oct 2011 16:28:35 +0200
Subject: [Buildroot] [PATCH] gdb: bump to 7.3.1
In-Reply-To: <4E8C5C31.5040703@visionsystems.de> (Yegor Yefremov's message of
 "Wed, 05 Oct 2011 15:31:29 +0200")
References: <4E856673.8020205@visionsystems.de>
 <20110930222606.2ed76af5@skate> <201110012324.54139.arnout@mind.be>
 <CAGm1_ktCdcObbXCYQryUOU5h=Sxpe+aE598NuLXU4HCQ9jCxrQ@mail.gmail.com>
 <878vozr32n.fsf@macbook.be.48ers.dk>
 <4E8C5C31.5040703@visionsystems.de>
Message-ID: <87zkhfpl64.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 Yegor> Have you looked at http://www.gnu.org/s/gdb/ 7.3 release notes?

 Yegor> " ia64 HP-UX (native) and Blackfin (target) support
 Yegor>   GDBserver support for PowerPC LynxOS, i686 LynxOS, and Blackfin Linux "

 Yegor> Can some one with blackfin test this? If it is working, we could
 Yegor> remove the dependence on !blfn.

Yes, I noticed as well. Bfin users, please speak up.

-- 
Bye, Peter Korsgaard
