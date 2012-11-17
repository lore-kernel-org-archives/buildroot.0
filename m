From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 17 Nov 2012 09:21:01 +0100
Subject: [Buildroot] [PATCH 1/2] Deprecate the support for the toolchain
	on target
In-Reply-To: <50A03A24.2010000@mind.be> (Arnout Vandecappelle's message of
 "Mon, 12 Nov 2012 00:52:04 +0100")
References: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
 <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
 <50A02C6D.1040105@mind.be> <20121111235938.358914c5@skate>
 <50A03A24.2010000@mind.be>
Message-ID: <87haoowsgi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >>> Who, documentation has nothing to do with the toolchain on target!
 >>> I can easily imagine use cases where you want to be able to do 'man
 >>> tcpdump' on the target.
 >> 
 >> Well this is what we agreed during the meeting, and is even noted in
 >> your Action Points at
 >> http://elinux.org/Buildroot:DeveloperDaysELCE2012#Action_points :-)

 Arnout>  Right.  Typing turns of your brain, to some extent :-)

On the other hand, documentation on the target doesn't have the same
problems as toolchain, so if people do use it, I don't have a problem
keeping it.

I've never personally used it though.

-- 
Bye, Peter Korsgaard
