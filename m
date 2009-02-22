From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 23 Feb 2009 00:16:56 +0100
Subject: [Buildroot] broken alsa-lib
In-Reply-To: <20090222224350.GG5893@buzzloop.caiaq.de> (Daniel Mack's message
	of "Sun\, 22 Feb 2009 23\:43\:50 +0100")
References: <20090222224350.GG5893@buzzloop.caiaq.de>
Message-ID: <87myce3vvb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> Hi,
 Daniel> as pointed out in two threads on the alsa-dev ML, there seems to be
 Daniel> general problem with ALSA libraries built by buildroot:

 Daniel> 	http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/014999.html
 Daniel> 	http://mailman.alsa-project.org/pipermail/alsa-devel/2009-February/015005.html

Alsa-lib had an issue with !LARGEFILE support that we fixed recently
and pushed upstream, but other than that I don't remember any
bugreports.

You mentioned something about 1.0.19, but buildroot is still using
1.0.18, are you using some local changes?

-- 
Bye, Peter Korsgaard
