From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 00:03:12 +0100
Subject: [Buildroot] [PATCH v4 1/2] libopenssl: bump version to 1.1.1a
In-Reply-To: <e09d9674-3ee7-7d9f-5579-063e44691582@mind.be> (Arnout
 Vandecappelle's message of "Wed, 23 Jan 2019 23:44:26 +0100")
References: <20190115224239.26125-1-ps.report@gmx.net>
 <20190116135821.pbjzcpixjbuacu3o@vkochan-ThinkPad-T470p>
 <20190117194339.5cb2eb0f@gmx.net>
 <ad65c62d-eef9-2113-cfb6-6b5941958285@mind.be>
 <877eewo0wr.fsf@dell.be.48ers.dk>
 <914629e8-64d8-29b5-0275-3355e45cb07a@mind.be>
 <87sgxjjqo1.fsf@dell.be.48ers.dk>
 <e09d9674-3ee7-7d9f-5579-063e44691582@mind.be>
Message-ID: <87tvhzht8v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> >  Both, I guess. Also that the whole known world (including Debian stable,
 >> > released June 2017) has already switched to 1.1.x.
 >> 
 >> With 1.1.x I take it you mean 1.1.0, right? The 1.1.1 series (strange
 >> numbering convention) was only released back in September.

 >  With 1.1.x I mean 1.1.0 or 1.1.1. The breakage comes from the 1.1.0 bump; .0 to
 > .1 is fairly smooth.

Ok. 1.1.0 was released 2.5 years ago (August 2016). How come we still
need fixes for quite some packages? All abandoned software? Should we
get rid of some of those packages?

-- 
Bye, Peter Korsgaard
