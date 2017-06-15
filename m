From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 15 Jun 2017 22:18:52 +0200
Subject: [Buildroot] [PATCH 0/8] Top-level Makefile fixes
In-Reply-To: <874lvhk1ur.fsf@dell.be.48ers.dk>
References: <20170614221135.17470-1-arnout@mind.be>
 <874lvhk1ur.fsf@dell.be.48ers.dk>
Message-ID: <7ef9622f-7355-c639-b704-ed7dace1e273@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-06-17 11:59, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  >  I saw this StackOverflow question [1], to which Luca gave a satisfactory
>  > answer, and noticed that this really shouldn't happen: when Buildroot
>  > isn't configured and you type 'make toolchain', you should get an error
>  > instead of "Nothing to be done.".
> 
> ENOURL?

 It was in the last patch as well :-)

[1] https://stackoverflow.com/questions/44521150


>  >  So I set out to fix that, one thing led to another, and here are 8
>  > patches :-)
> 
>  >  As described in the last patch, there are in fact two different ways
>  > to fix it. I already have a patch for the alternative so I can post it
>  > if necessary.
> 
> Committed patch 1-7. I would like to think a bit more about patch 8 and
> perhaps get feedback from others.

 I'll send the simpler alternative as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
