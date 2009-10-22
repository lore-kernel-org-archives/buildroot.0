From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Oct 2009 22:30:25 +0200
Subject: [Buildroot] perl depends miniperl
In-Reply-To: <4AE07A68.8090403@renta.net> (Mark Constable's message of "Fri\,
	23 Oct 2009 01\:29\:44 +1000")
References: <4AE07A68.8090403@renta.net>
Message-ID: <87hbtrnpcu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Constable <markc@renta.net> writes:

 Mark> In the pursuit of a usable ar I thought I'd select Target options

For an ar with write support, you probably need binutils/gcc on the
target.

 Mark> -> Generic development system and see what happens but it stopped
 Mark> at this point where, I presume, building perl requires
 Mark> ../../miniperl.

Our perl is miniperl, so there must be something broken in the miniperl
package.

 Mark> Any suggestion how to work around this one?

 Mark> I really do not want perl at all. Certainly not on the target.

Then don't enable it ;)

-- 
Bye, Peter Korsgaard
