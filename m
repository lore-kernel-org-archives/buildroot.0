From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jan 2013 22:18:09 +0100
Subject: [Buildroot] [PATCH 1/3] libcofi: new package
In-Reply-To: <CAGduivzsNvuYaaFAa8M=y5WJXS_vA4V46nyC2dM5ak5t2T8H=Q@mail.gmail.com>
 (Maxime Hadjinlian's message of "Sun, 6 Jan 2013 22:13:59 +0100")
References: <cover.1357505417.git.maxime.hadjinlian@gmail.com>
 <ca62bc23d6fea2e485408cce7bfdf1835a4bfb15.1357505417.git.maxime.hadjinlian@gmail.com>
 <877gnqf2k7.fsf@dell.be.48ers.dk>
 <CAGduivzsNvuYaaFAa8M=y5WJXS_vA4V46nyC2dM5ak5t2T8H=Q@mail.gmail.com>
Message-ID: <87hamudn8u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

Hi,

 >> The package looks ok from a quick look, but how is it supposed to be
 >> used? I wouldn't like to see patches to a bunch of packages to link
 >> against this.
 Maxime> As the author of the package says, the library is used using
 Maxime> LD_PRELOAD on the target.
 Maxime> So no patch should be needed for any packages.

Ok, great.

 >> 
 >> It isn't really rpi specific either.
 Maxime> I don't know about that, the author says it's rpi specific.

The optimizations presumably also applies to other ARM11(76) processors
with similar memory speed.

-- 
Bye, Peter Korsgaard
