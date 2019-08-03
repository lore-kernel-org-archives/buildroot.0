From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 14:26:09 +0200
Subject: [Buildroot] [PATCH 0/4] new builtin kernel with entropy for the
 test infra
In-Reply-To: <8b2b02d6-354c-bc13-05c9-6c0f27447eba@mind.be> (Arnout
 Vandecappelle's message of "Sat, 3 Aug 2019 13:24:10 +0200")
References: <20190803052216.22292-1-ricardo.martincoski@gmail.com>
 <20190803082434.0080779f@windsurf.home>
 <8b2b02d6-354c-bc13-05c9-6c0f27447eba@mind.be>
Message-ID: <878ssae8pq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> Thanks a lot for working on this. However, instead of having this new
 >> kernel as a separate "version" from the current ARMv5 pre-built kernel,
 >> why don't we simply update the existing one ?

 >  IMO it's rarely a good idea to overwrite an existing file that can be
 > downloaded. So I'd apply Ricardo's patches as is.

Still, it would be good to use this new kernel for builtin / armv5 - But
Ok, that can be fixed when applying.

-- 
Bye, Peter Korsgaard
