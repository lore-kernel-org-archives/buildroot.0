From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Oct 2009 20:25:19 +0200
Subject: [Buildroot] [RFC] *clean targets
In-Reply-To: <87skdvkr8z.fsf@macbook.be.48ers.dk>
References: <20091007162422.GI10261@mx.loc> <1254933143.18927.5.camel@sven>
	<87skdvkr8z.fsf@macbook.be.48ers.dk>
Message-ID: <20091007182519.GB23847@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 07, 2009 at 08:12:28PM +0200, Peter Korsgaard wrote:
>>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
>
> Sven> On Wed, 2009-10-07 at 18:24 +0200, Bernhard Reutner-Fischer wrote:
> >> # roll a release tarball, in gz, bz2, xz format
> >> release:
>
> Sven> That target is usually called 'dist'. At least that's what automake puts
> Sven> in your Makefile...
>
>Yes, but we've had a release target for a long time (and I use it).
>
>I'm not strongly against renaming it though.

we can just
dist release:
but let's keep release, too.
