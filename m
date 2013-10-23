From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Oct 2013 14:24:47 +0200
Subject: [Buildroot] git packages and revision number length
In-Reply-To: <CAAXf6LUjx9RjkCQDbO+O3EZfFPPYNW-5hQUpANG9jCgekokbpw@mail.gmail.com>
References: <CAAXf6LUjx9RjkCQDbO+O3EZfFPPYNW-5hQUpANG9jCgekokbpw@mail.gmail.com>
Message-ID: <20131023142447.7d45e0d3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 23 Oct 2013 13:54:01 +0200, Thomas De Schampheleire wrote:

> I disagree with that. The first 7 characters do not guarantee that a
> few years from now their will not be an ambiguity in that project,
> where two revisions have the same 7 initial characters.
> 
> Shortened revision numbers are great in communication (verbal, mail,
> IRC, ...) but should not be committed in a build system that is
> supposed to create reproducible builds over a long-term lifespan.
> 
> We can start discussing statistics, about how many years it takes on
> average for a clash to occur with a given revision number length, but
> the fact is that it is possible to have a clash by tomorrow. Only the
> chances are much smaller with increasing lengths.
> 
> So I propose to change that recommendation (and the packages that use
> it) and use the full 40-hex-char revision numbers.

I agree with you, especially since using reduced 7-hex-char revision
numbers over full 40-hex-char revision numbers doesn't bring any
specific advantage. Using full hashes doesn't hurt, and is more
future-proof so let's do it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
