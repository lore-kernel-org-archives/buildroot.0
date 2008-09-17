From: =?ISO-8859-1?Q?St=E9phane?= Mancini <stephane.mancini@grenoble-inp.fr>
Date: Wed, 17 Sep 2008 14:24:13 +0200
Subject: [Buildroot] Login on a ttyS fails
In-Reply-To: <1221652957.30276.16.camel@chip.lis.inpg.fr>
References: <1221579108.7973.21.camel@chip.lis.inpg.fr>
	<873ak07x9m.fsf@macbook.be.48ers.dk>
	<1221648506.30276.10.camel@chip.lis.inpg.fr>
	<874p4f2elw.fsf@macbook.be.48ers.dk>
	<1221652957.30276.16.camel@chip.lis.inpg.fr>
Message-ID: <1221654253.30276.18.camel@chip.lis.inpg.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Well, I've tried to launch ash after the boot instead of init.
I get a kernel panic :

init has generated signal 4 but has no handler for it

Kernel panic - not syncing: Attempted to kill init!

Rebooting in 180 seconds..


It seems that there is an "illegal instruction".

Is there a way to get the program counter and instruction code that
caused this signal ?
By the way, why the message states that "init" generates the signal
while I launched ash ?

Maybe there are troubles with my processor or the memory is getting
corrupted after I download the kernel....
