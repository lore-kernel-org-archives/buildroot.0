From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Nov 2012 17:32:54 +0100
Subject: [Buildroot] no jack?
In-Reply-To: <50999970.3020308@mind.be> (Arnout Vandecappelle's message of
 "Wed, 07 Nov 2012 00:12:48 +0100")
References: <CAN0CFw31RjieVoSKf9QOAud5yHe6w-oy_J77V9iLYxu2-pSz5g@mail.gmail.com>
 <50999970.3020308@mind.be>
Message-ID: <874nl09hs9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 06/11/12 22:39, Grant wrote:
 >> Is there a jack package available for buildroot?

 Arnout>  No, but it shouldn't be too difficult to integrate.  Look at
 Arnout> midori for an example of a package using waf as the build
 Arnout> system.

Waf is btw a pain. It seems to fail on one of the autobuilders (host
python issue?)

-- 
Bye, Peter Korsgaard
