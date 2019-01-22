From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Jan 2019 22:08:52 +0100
Subject: [Buildroot] [PATCH v4 1/2] libopenssl: bump version to 1.1.1a
In-Reply-To: <ad65c62d-eef9-2113-cfb6-6b5941958285@mind.be> (Arnout
 Vandecappelle's message of "Tue, 22 Jan 2019 12:23:14 +0100")
References: <20190115224239.26125-1-ps.report@gmx.net>
 <20190116135821.pbjzcpixjbuacu3o@vkochan-ThinkPad-T470p>
 <20190117194339.5cb2eb0f@gmx.net>
 <ad65c62d-eef9-2113-cfb6-6b5941958285@mind.be>
Message-ID: <877eewo0wr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  At some point, we'll just have to let an autobuilder detect the issues. Some
 > issues anyway only become apparent at link time, so when building a dependency
 > of a dependency...

 >  We have an autobuilder running on an openssl-bump branch and Patrick is fixing
 > the issues that come out. But at some point we'll need to just bite the bullet
 > and accept the whole thing.

 >  I do hope that it could still go into 2019.02.

If that is our goal, then we might as well merge it ASAP to get more
test coverage?

What is the killer feature why we need openssl-1.1.x in 2019.02.x? TLS
1.3 or just that 1.0.2 goes EOL at the end of the year?

-- 
Bye, Peter Korsgaard
