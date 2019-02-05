From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 11:40:11 +0100
Subject: [Buildroot] [PATCH v2] docs/website: consolidate CDN's and
 enable SRI
In-Reply-To: <4f0406e1-aace-c31d-0683-dd99af63ae9a@mind.be> (Arnout
 Vandecappelle's message of "Tue, 5 Feb 2019 11:24:59 +0100")
References: <1549275445-11857-1-git-send-email-angelo@amarulasolutions.com>
 <87y36vvij1.fsf@dell.be.48ers.dk>
 <CA+_SqVbAV37MoGC64N3ai--f0Wv3-nXZ2vOqwvVW0EVLC6Ysqg@mail.gmail.com>
 <87lg2vvepy.fsf@dell.be.48ers.dk>
 <CA+_SqVZjokW23jK4j1aKqUtHFCbRAn2s8zXWvZ-2mFN3AoNTwQ@mail.gmail.com>
 <CADvTj4oes1KgCv2TqLTnjPsJr+GZhCWZTS1DkTx3nGR5DiGmmg@mail.gmail.com>
 <4f0406e1-aace-c31d-0683-dd99af63ae9a@mind.be>
Message-ID: <87ef8mplh0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 04/02/2019 23:30, James Hilliard wrote:
 >> Using a CDN can speed up performance due to browsers caching assets
 >> across different sites from my understanding.

 >  Indeed, I think that is the main reason to use a CDN:

 > 1. It is likely to be cached already on the browser, and
 > 2. It avoids that the driver needs to open connections to various site, it can
 > just open one (HTTP/2 or /3) connection do the CDN if it really does need to get
 > the stuff.

 >  That said, since these files are tiny, it's probably not important (definitely
 > not important enough to bikeshed over :-).

Agreed.

 > The SRI, on the other hand, *is* important IMO.

Agreed, if we refer to ressources out of our control we should
definately use SRI.

-- 
Bye, Peter Korsgaard
