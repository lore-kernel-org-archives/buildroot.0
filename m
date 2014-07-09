From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2014 09:12:03 +0200
Subject: [Buildroot] [PATCH] ARC: disable packages that require atomic
	builtins
In-Reply-To: <1404883158.4553.6.camel@abrodkin-8560l.internal.synopsys.com>
 (Alexey Brodkin's message of "Wed, 9 Jul 2014 05:19:19 +0000")
References: <1404742914-21583-1-git-send-email-abrodkin@synopsys.com>
 <53BAC241.9070808@mind.be>
 <1404883158.4553.6.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <87wqbnt398.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

Hi,

 > I see that dependencies list is getting longer and longer.

 > In coming days we're about to release a new version of tools for ARC and
 > as a part of this upcoming release we'll enable atomic operations by
 > default for ARC. This should immediately fix all those previously broken
 > packages.

 > So I'd prefer to wait for mentioned update and if it works as we expect
 > there will be no need in fixing more packages... moreover we'll need to
 > re-enable packages we already disabled like "jack2", "msgpack" and some
 > others.

Ok, that sounds great!

-- 
Bye, Peter Korsgaard
