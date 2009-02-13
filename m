From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Feb 2009 20:35:05 +0100
Subject: [Buildroot] X not compiling
In-Reply-To: <20090213151304.kec0npcmososccc0@webmail.digibel.be>
	(steve@c2root.be's message of "Fri\,
	13 Feb 2009 15\:13\:04 +0100")
References: <20090213092541.zth6uhlvmswks4oo@webmail.digibel.be>
	<20090213151304.kec0npcmososccc0@webmail.digibel.be>
Message-ID: <87y6wadtau.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "steve" == steve  <steve@c2root.be> writes:

 steve> Solved
 steve> was missing font-utils on the host system

Hmm, we should probably compile it in BR for the host then. Will
investigate ..

-- 
Bye, Peter Korsgaard
