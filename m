From: Sam Bobroff <sam.bobroff@au1.ibm.com>
Date: Wed, 29 Nov 2017 10:30:28 +1100
Subject: [Buildroot] Analysis of build results for 2017-11-25
In-Reply-To: <OF3CB5EEB3.059011A8-ON002581E5.004E2384@notes.na.collabserv.com>
References: <20171126070006.676FA209DE@mail.free-electrons.com>
 <20171126152140.0fd3902b@windsurf.home>
 <CAJtjsKZjOxXO=Gu475a+6gP9TR4RrEptaS1MfuHYpdzjbF5Aig@mail.gmail.com>
 <OF3CB5EEB3.059011A8-ON002581E5.004E2384@notes.na.collabserv.com>
Message-ID: <20171128233028.a7dqd7nmj6q5hf6r@tungsten.ozlabs.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 27, 2017 at 03:13:24PM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 27 Nov 2017 15:01:29 +0100, Johan Oudinet wrote:
> 
> > > Also, perhaps this is something our PowerPC64 friends from IBM could
> > > help fixing? Sam? Joel?  

I don't have much time at the moment but I'll take a look at this when I
can (in a previous life I was an Erlang programmer, it's great to see it
as part of buildroot!). It would be sad to disable HiPE so I'll see if
we can just bump the version up to 20.

Or Johan if you get to it first, I'll certainly test it :-)

> > I've asked for an account.
> > In the meantime, looking for Erlang users on powerpc64le (I barely use
> > it myself and have no such architecture at my disposal), it looks like
> > this was fixed in OTP 20:
> > https://bugs.erlang.org/browse/ERL-369
> 
> Interesting. So it seems like passing --disable-hipe would work around
> the problem for ppc64le, correct ?
> 
> Or perhaps better we just backport
> https://github.com/erlang/otp/pull/1394/commits ?
> 
> > From Erlang website, it looks like OTP 20 and OTP 20.1 have been
> > released. May Erlang maintainer's (Will Newton) bump the version?
> 
> Will Newton has not been active in Buildroot since 2014, so I'm not
> sure he intends to bump Erlang. Could you do this instead, and add
> yourself for erlang in the DEVELOPERS file ? :-)
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> https://urldefense.proofpoint.com/v2/url?u=http-3A__free-2Delectrons.com&d=DwICAg&c=jf_iaSHvJObTbx-siA1ZOg&r=FFlZoKpUuHop_w02rKHYxbjM9foF4tIm4FyKg8muba0&m=wAiVrPt_rOu6QZ_ovDTmounnylPB0jFSNqMx58-8OlU&s=u5PLESafGWZObPrye3-pTnxs_73LPfQEVtERQHanMZA&e=
> 
