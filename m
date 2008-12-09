From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Dec 2008 10:00:36 +0100
Subject: [Buildroot] [PATCH] make the default etc/init.d/S40network
	compatible with msh
In-Reply-To: <alpine.LFD.2.00.0812081651380.14328@xanadu.home> (Nicolas
	Pitre's message of "Mon\, 08 Dec 2008 16\:59\:26 -0500 \(EST\)")
References: <alpine.LFD.2.00.0812031424090.14328@xanadu.home>
	<874p1ewwed.fsf@macbook.be.48ers.dk>
	<alpine.LFD.2.00.0812081651380.14328@xanadu.home>
Message-ID: <87ljuppvt7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Pitre <nico@cam.org> writes:

Hi,

 >> A lot of the other startup scripts (dbus, dropbear, hal,
 >> mdnsresponder, ..) also use functions, but I take it those aren't
 >> relevant for uclinux?

 Nicolas> I didn't use those, except for dropbear which startup script
 Nicolas> I modified as well (to only create the initial host keys
 Nicolas> since the dropbear server is otherwise started through
 Nicolas> inetd).

Ok.

 >> It would btw be handy if you could create your patches with one more
 >> level, so I can apply them with git-am without having to remember to
 >> add -p 0.

 Nicolas> True indeed.  I generated those patches with svn diff, and
 Nicolas> being so used to git I forgot that other systems have
 Nicolas> different defaults.

 Nicolas> Now what about the 10 or so other patches I posted?  Will
 Nicolas> they get merged?  I have more patches to post but I wanted
 Nicolas> to see what was going to happen with this lot first.

I haven't gotten around to look at them yet. I will sooner or later,
but I'm afraid I cannot give you any guarantees regarding time frame.

The other developers are more than welcome to assist.

-- 
Bye, Peter Korsgaard
