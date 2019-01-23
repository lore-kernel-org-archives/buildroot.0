From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 17:15:58 +0100
Subject: [Buildroot] [PATCH v4 1/2] libopenssl: bump version to 1.1.1a
In-Reply-To: <914629e8-64d8-29b5-0275-3355e45cb07a@mind.be> (Arnout
 Vandecappelle's message of "Wed, 23 Jan 2019 15:29:46 +0100")
References: <20190115224239.26125-1-ps.report@gmx.net>
 <20190116135821.pbjzcpixjbuacu3o@vkochan-ThinkPad-T470p>
 <20190117194339.5cb2eb0f@gmx.net>
 <ad65c62d-eef9-2113-cfb6-6b5941958285@mind.be>
 <877eewo0wr.fsf@dell.be.48ers.dk>
 <914629e8-64d8-29b5-0275-3355e45cb07a@mind.be>
Message-ID: <87sgxjjqo1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> >  I do hope that it could still go into 2019.02.
 >> 
 >> If that is our goal, then we might as well merge it ASAP to get more
 >> test coverage?
 >> 
 >> What is the killer feature why we need openssl-1.1.x in 2019.02.x? TLS
 >> 1.3 or just that 1.0.2 goes EOL at the end of the year?

 >  Both, I guess. Also that the whole known world (including Debian stable,
 > released June 2017) has already switched to 1.1.x.

With 1.1.x I take it you mean 1.1.0, right? The 1.1.1 series (strange
numbering convention) was only released back in September.

1.1.0 is not a LTS so not suitable for 2019.02.x. 1.0.2 is supported
until the end of 2019, so that is IMHO still OK for 2019.02.

I agree that having 1.1.1x in 2019.02.x would be nice, but a pity that
quite some packages break with it (even if the whole known world has
switched to it).

-- 
Bye, Peter Korsgaard
