From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 13 Oct 2013 17:01:48 +0200
Subject: [Buildroot] Bumping packages: some comments/suggestions
In-Reply-To: <20131013154229.36a438c9@skate>
References: <20131013114246.440c3831@skate>
 <CAFRkauCECxjxqB5=ufBW5Sve+2aGyMBKSOY+9vpPe0gueV7S1Q@mail.gmail.com>
 <20131013154229.36a438c9@skate>
Message-ID: <CAAXf6LXQ4Tv3QGsx2atT=C6yg-HDGoRHDKpJBKyzC4g8-phbDw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Oct 13, 2013 at 3:42 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
>> >  *) To make this "bumping" effort a bit more systematic, I believe it
>> >     would be useful to introduce an infrastructure in Buildroot to
>> >     automatically check if upstream has a new package. In many cases,
>> >     the upstream site has a directory with all the different versions
>> >     of the tarball, so checking if there's a newer one in an automated
>> >     way would be possible. If we do this for many packages, then we can
>> >     run a script every day, and check if there are new upstream
>> >     releases available. Debian has such a mechanism with the 'watch'
>> >     mechanism (see https://wiki.debian.org/debian/watch/). Gentoo has
>> >     the euscan utility (see https://github.com/iksaif/euscan). It would
>> >     be nice having something like this, that we could integrate in the
>> >     Buildroot per-package stats at
>> >     http://autobuild.buildroot.org/stats/ to get a clear vision of
>> >     which packages need to be upgraded. If one of you is interested in
>> >     doing this, it'd be great!
>
> Any opinion about this? I believe it would make more sense to invest
> time doing this than doing many many bumps on all packages.

I assume you're only talking about a way to automatically _detect_
that there are new versions of a given package, and the actual update
in buildroot is still done manually, right?

Best regards,
Thomas
