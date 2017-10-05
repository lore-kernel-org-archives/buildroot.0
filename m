From: Ismael Luceno <ismael@iodev.co.uk>
Date: Thu, 5 Oct 2017 18:20:10 -0300
Subject: [Buildroot] [PATCH] pkg-download: make package name optional in
 github helper
In-Reply-To: <8ffd6e7b-4a9e-e23b-38b1-2144ea207705@mind.be>
References: <20171004085745.15457-1-ismael@iodev.co.uk>
 <26d3dc60-5a3a-0fce-f3cf-b75ee2670644@mind.be>
 <20171005101312.GA9688@pirotess.bf.iodev.co.uk>
 <8ffd6e7b-4a9e-e23b-38b1-2144ea207705@mind.be>
Message-ID: <20171005212008.GA24521@pirotess.bf.iodev.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/Oct/2017 19:50, Arnout Vandecappelle wrote:
> On 05-10-17 12:13, Ismael Luceno wrote:
<...>
> > It's "magic" anyway. It would perhaps make sense to implement this kind
> > of rules via rewriting AXEL_SITE, it could be something descriptive like:
> > 
> > 	AXEL_SITE = @ github user:axel-download-accelerator repo:libtls
> > 
> > Here's a mockup: http://tmp.iodev.co.uk/rtest.mk
> 
> Here also I don't think the added complexity in the implementation is
> worth it.  It is indeed a bit more explicit, but now you have to
> remember that the arguments are called user: and repo:. For me,
> $(call github,axel-download-accelerator,libtls) is an easy-to-remember
> way to refer to https://github.com/axel-download-accelerator/libtls.

Well, it's an interesting exercise anyway; I've simplified it a little
bit (same URL), I think this could be useful for other purposes.

It's perhaps not so obvious where to look for to see how it works, but
documentation fixes that.
