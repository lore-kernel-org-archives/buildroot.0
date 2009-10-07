From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 20:12:28 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <1254933143.18927.5.camel@sven> (Sven Neumann's message of "Wed\,
	07 Oct 2009 18\:32\:23 +0200")
References: <20091007162422.GI10261@mx.loc> <1254933143.18927.5.camel@sven>
Message-ID: <87skdvkr8z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> On Wed, 2009-10-07 at 18:24 +0200, Bernhard Reutner-Fischer wrote:
 >> # roll a release tarball, in gz, bz2, xz format
 >> release:

 Sven> That target is usually called 'dist'. At least that's what automake puts
 Sven> in your Makefile...

Yes, but we've had a release target for a long time (and I use it).

I'm not strongly against renaming it though.

-- 
Bye, Peter Korsgaard
