From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 May 2011 22:16:41 +0200
Subject: [Buildroot] RFC: toolchain wrapper for external toolchains
In-Reply-To: <20110508190135.0b9df312@surf> (Thomas Petazzoni's message of
	"Sun, 8 May 2011 19:01:35 +0200")
References: <1304433655-1629-1-git-send-email-jacmet@sunsite.dk>
	<BANLkTi=w7UaAyk4T2SHjv5h9Pm+gRQW+4g@mail.gmail.com>
	<20110508190135.0b9df312@surf>
Message-ID: <87r589j6c6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I am not entirely happy with how things went with this patch
 Thomas> set. It touches a fairly major mechanism in the external
 Thomas> toolchain support, and it has been committed without an
 Thomas> official Acked-by from the most active contributor in this
 Thomas> area.

I understand your frustration and agree that this could have been
handled better.

 Thomas> Moreover, it has been committed only two days after the
 Thomas> proposal, a duration which is very short for the other
 Thomas> contributors to take the time to test the patches and give
 Thomas> their opinion. This is also very short compared to the amount
 Thomas> of time many other contributions have been waiting for being
 Thomas> merged. For example, have a look at the patch set I contributed
 Thomas> on April, 2nd
 Thomas> (http://lists.busybox.net/pipermail/buildroot/2011-April/042309.html),
 Thomas> which is also something that has been discussed during the
 Thomas> FOSDEM meeting.

Yes. The config option rename is naturally massively intrusive, so I
didn't want to rush to apply it (E.G. see the recent discussion about
differing between what the toolchain has for ext toolchains and what we
want to enable - E.G. ipv6 support)

 Thomas> And finally, I am also unhappy because these changes were
 Thomas> broken in a basic way: the first test I did with a basic
 Thomas> CodeSourcery external toolchain failed (see the patch I just
 Thomas> sent). I don't, by far, claim to always post well-tested and
 Thomas> perfect patches. However, added to the very quick
 Thomas> post-to-commit delay and the absence of real ACK from other
 Thomas> contributors, it makes me a little bit unhappy.

I agree. I rushed things a bit too much because of other real life
issues and the fact that we're already late for -rc1. Sorry about this.

 Thomas> In the future, would it be possible to leave more time between
 Thomas> post and commit, for such major infrastructure changes ?

Sure.

-- 
Bye, Peter Korsgaard
