From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Jan 2021 00:07:23 +0100
Subject: [Buildroot] Patch for linux-headers
In-Reply-To: <20210105224940.GA158146@pevik> (Petr Vorel's message of "Tue, 5
 Jan 2021 23:49:40 +0100")
References: <20201217003006.GA343694@pevik> <87czyj6p8i.fsf@dell.be.48ers.dk>
 <20210105224940.GA158146@pevik>
Message-ID: <87czyj3rv8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

Hi,

 >> It can be done if needed, but it is naturally easier to handle
 >> without.
 > Understand. More versions and kernel checking would be needed.
 > I implemented it, but IMHO it'd have to also require Buildroot toolchain
 > rebuild.

Indeed.

 >> I noticed that you got some patches applied to the stable
 >> kernels related to this recently - Do those fix the issues, or is an
 >> additional patch needed?
 > Yes, it fixes the issue. Thus no patching is needed.

Ok, great!

 > OK, we need to wait till kernel stable releases, update kernel versions in
 > Buildroot. But IMHO it still requires Buildroot toolchain rebuild. Or am I wrong?

Yes, the external toolchains will need to be rebuilt, but perhaps we can
blacklist those in the autobuilders until the toolchains are all rebuilt.

 > BTW I'm waiting for it for iproute2 upgrade (originally [1] and [2], now [3]).

Ahh, ok.

-- 
Bye, Peter Korsgaard
