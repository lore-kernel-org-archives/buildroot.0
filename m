From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Feb 2009 09:44:24 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <20090222232955.GA10011@buzzloop.caiaq.de> (Daniel Mack's message
	of "Mon\, 23 Feb 2009 00\:29\:55 +0100")
References: <20090222224350.GG5893@buzzloop.caiaq.de>
	<87myce3vvb.fsf@macbook.be.48ers.dk>
	<20090222232955.GA10011@buzzloop.caiaq.de>
Message-ID: <877i3h4k5z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 >> Alsa-lib had an issue with !LARGEFILE support that we fixed recently
 >> and pushed upstream, but other than that I don't remember any
 >> bugreports.

 Daniel> Hmm, what I see is certainly not a LARGEFILE issue.

Probably not, just mentioning the only bugs we've found in alsa lib
recently.

 >> You mentioned something about 1.0.19, but buildroot is still using
 >> 1.0.18, are you using some local changes?

 Daniel> Yes, true, forgot to mention that. We locally patched to use
 Daniel> 1.0.19 but that was merely because I hoped to fix the problem
 Daniel> by that - the same problem exists with 1.0.18. And I got this
 Daniel> problem since a long time and always patched my way around it
 Daniel> (by overriding the value with some hard-coded constant) as I
 Daniel> thought it is a minor issue that will be fixed sooner or
 Daniel> later. But as it turns out, the problem seems to be bigger
 Daniel> and might also have other impact than just that single
 Daniel> failing function call.

Please report those kind of problems to us so we have a chance to fix
them. This is the first I hear of it.

 Daniel> I'll build alsa-lib and alsa-utils with OE tomorrow and see
 Daniel> whether that makes any difference.

Great, Please send us the config.log from OE and BR if it works under
OE.

-- 
Bye, Peter Korsgaard
