From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Feb 2009 19:11:28 +0100
Subject: [Buildroot] problem building openswan using svn-buildroot
In-Reply-To: <49A17E91.7060104@unix-beratung.de> (Robert Urban's message of
	"Sun\, 22 Feb 2009 17\:34\:25 +0100")
References: <499E05A7.2070403@unix-beratung.de>
	<87bpsv6ik4.fsf@macbook.be.48ers.dk>
	<49A17E91.7060104@unix-beratung.de>
Message-ID: <87y6vy5okv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Urban <urban@unix-beratung.de> writes:

 Robert> Hi Peter,

 Robert> thanks for your reply.  I was beginning to get the impression
 Robert> that nobody cares about openswan :) Is there a better
 Robert> alternative?

Sorry, I don't know - Anyone else?

 Robert> In the meantime I managed to get openswan to compile after a
 Robert> simplistic one-line-correction to
 Robert> .../programs/pluto/connection.h.  The diff follows.  I dunno
 Robert> if my fix suffices for the general population...

Thanks, but that ofcourse doesn't change the general situation that
the openswan package hasn't seen any development since early 2007,
which probably isn't a good thing for something security related.

-- 
Bye, Peter Korsgaard
