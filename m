From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Feb 2014 09:19:15 +0100
Subject: [Buildroot] [PATCH] glibc: add 2.19 as a supported version
In-Reply-To: <52F9D9D0.8090409@mind.be> (Arnout Vandecappelle's message of
 "Tue, 11 Feb 2014 09:05:36 +0100")
References: <1392054226-20285-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52F936C7.4040300@mind.be> <20140210234117.352533a5@skate>
 <52F9D9D0.8090409@mind.be>
Message-ID: <87ha86vz7g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> For glibc, however, I really don't see a reason to keep multiple versions.
 >> 
 >> My plan was to offer no more than two versions: N-1 and N, so that we
 >> can add N, and give it some testing before having all users move

 >  I don't think there will be a lot of testing happening there...

Why not?

 >  No, I don't think we have a reason to keep multiple versions for
 > binutils, gdb, and also busybox BTW.

I'm certainly open to limit the number of options, but completely
removing them right away is imho too much.

 >  For gcc it's a bit more appropriate. I have seen (proprietary) packages
 > that fail to build with a different gcc version - usually because of
 > -Werror and different warnings in -Wall.

Another example is older Linux kernels (E.G. for projects stuck with a
non-mainline BSP).

-- 
Bye, Peter Korsgaard
