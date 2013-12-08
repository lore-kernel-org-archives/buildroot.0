From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 8 Dec 2013 12:01:25 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-12-07
In-Reply-To: <20131208120858.1d8636b4@skate>
References: <20131208073009.673C5101507@stock.ovh.net>
 <CAHt8ZCNu8Nwzh1LfD00CQ3CTMsS8NQ51GmdM+9QiRfzg-s_ShQ@mail.gmail.com>
 <87haajborq.fsf@dell.be.48ers.dk> <20131208120858.1d8636b4@skate>
Message-ID: <CAHt8ZCO_+TUHTwU6x7jgOh-S91=w0gG9NsJgo80keR4Yb+kV8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 8 December 2013 11:08, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> In the mean time, can we revert the problematic patches from Buildroot,
> so that we get sane autobuild results? Having 27 failures on gpsd
> within a day means that we're hiding several other potential problems
> in other packages.

There are two options, as far as I can see:
# Revert the 3.9 -> 3.10 gpsd version bump
# Backport some gpsd patches (currently there are three of these), and
probably bump the Git snapshot ID
Personally, I'd prefer the second option, as any outstanding autobuild
failures will be useful to me in continuing to push fixes upstream
before the impending 3.11 release.

What's your preference?

Simon.
