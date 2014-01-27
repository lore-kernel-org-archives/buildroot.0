From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jan 2014 15:26:21 +0100
Subject: [Buildroot] [PATCH] tcpreplay: cross-compile with tcpdump
	support
In-Reply-To: <CAFOYHZA-wWx2ET2ibXNukvVX0rrsnK85H7+X+YR9oD=0WqNm1A@mail.gmail.com>
 (Chris Packham's message of "Fri, 24 Jan 2014 11:47:46 +1300")
References: <87txcvb13p.fsf@dell.be.48ers.dk>
 <1390468034-7430-1-git-send-email-judge.packham@gmail.com>
 <87ppnjaqam.fsf@dell.be.48ers.dk> <52E176D9.6040101@barkynet.com>
 <87zjmm9yhp.fsf@dell.be.48ers.dk>
 <CAFOYHZA-wWx2ET2ibXNukvVX0rrsnK85H7+X+YR9oD=0WqNm1A@mail.gmail.com>
Message-ID: <8761p5zek2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

Hi,

 >> > So i think this patch will work.
 >> 
 >> Ups, you're right - Sorry.
 >> 
 >> Committed patch, thanks.
 >> 

 > Thanks. I was about to say the same thing.

 > On the build error front are we concerned about the failures? I
 > haven't heard anything from upstream yet. We probably want to move to
 > tcpreplay 4.0.2 before the buildroot 2014.02 release.

Yes, I got tired of the autobuilder issues, so I've added your patch
from the pull request.

A patch to bump the version would be good as well, thank.

-- 
Bye, Peter Korsgaard
