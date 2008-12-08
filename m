From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 08 Dec 2008 15:53:46 +0100
Subject: [Buildroot] [PATCH] make the default etc/init.d/S40network
	compatible with msh
In-Reply-To: <alpine.LFD.2.00.0812031424090.14328@xanadu.home> (Nicolas
	Pitre's message of "Wed\, 03 Dec 2008 14\:24\:46 -0500 \(EST\)")
References: <alpine.LFD.2.00.0812031424090.14328@xanadu.home>
Message-ID: <874p1ewwed.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Pitre <nico@cam.org> writes:

 Nicolas> msh is currently the only good choice for uClinux but it doesn't
 Nicolas> understands shell functions.  In this case there is nothing to gain
 Nicolas> by using shell functions anyway.

 Nicolas> Signed-off-by: Nicolas Pitre <nico@cam.org>

A lot of the other startup scripts (dbus, dropbear, hal,
mdnsresponder, ..) also use functions, but I take it those aren't
relevant for uclinux?

Anyway, committed as r24325.

It would btw be handy if you could create your patches with one more
level, so I can apply them with git-am without having to remember to
add -p 0.

-- 
Bye, Peter Korsgaard
