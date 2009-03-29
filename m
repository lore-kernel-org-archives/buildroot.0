From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Mar 2009 21:18:45 +0200
Subject: [Buildroot] Error building libX11 on Buildroot 0.90.2 stable
In-Reply-To: <874oxggiz9.fsf@macbook.be.48ers.dk> (Peter Korsgaard's message
	of "Thu\, 26 Mar 2009 20\:52\:10 +0100")
References: <41370a610903261143r9ec110cu2edeaa3c6136cafd@mail.gmail.com>
	<874oxggiz9.fsf@macbook.be.48ers.dk>
Message-ID: <87ljqodtnu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

 Peter> configure:23596: checking keysymdef.h
 Peter> configure:23601: result: /usr/include/X11/keysymdef.h

 Peter> So it searches for and finds the host header. I'll look into fixing
 Peter> this, but in the mean time you can install it on your host (something
 Peter> like x11proto-core-dev) to continue.

It should be fixed now in r25881, could you give it a try? Notice that
we still need to compile libX11 for the host for the host versions of
cairo/pango/libgtk2 needed to compile libgtk2.

-- 
Bye, Peter Korsgaard
