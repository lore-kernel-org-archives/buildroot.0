From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Dec 2009 14:52:35 +0100
Subject: [Buildroot] tremor / libvorbis confusion
In-Reply-To: <1259846732.17178.0.camel@sven> (Sven Neumann's message of "Thu, 
	03 Dec 2009 14:25:32 +0100")
References: <1259839997.12310.9.camel@sven>
	<87my20ryh5.fsf@macbook.be.48ers.dk> <1259846732.17178.0.camel@sven>
Message-ID: <87iqcorwpo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

Hi,

 >> I agree - As long as we can have the stuff that now transparently uses
 >> tremor instead of libvorbis if enabled work more or less the same.

 Sven> Is there such stuff? Please point me to it then, so that I can
 Sven> make sure that my patches won't break things.

Hmm, no there isn't. I somehow imagined we had packages that could use
tremor instead of vorbis. If we would add E.G. musicpd then that could
be done.

Sorry for the noise.

-- 
Bye, Peter Korsgaard
