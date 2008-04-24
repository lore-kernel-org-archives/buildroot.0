From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 20:58:30 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/java: classpath
	concierge jamvm
In-Reply-To: <46a136670804241134t28b93dddl80fd382224d0afa1@mail.gmail.com>
	(John Voltz's message of "Thu\, 24 Apr 2008 14\:34\:02 -0400")
References: <20080424164821.800223C7C2@busybox.net>
	<874p9r408c.fsf@macbook.be.48ers.dk>
	<46a136670804241111j3548905fn3ca6f80b56e92dcf@mail.gmail.com>
	<87fxtb2jxo.fsf@macbook.be.48ers.dk>
	<46a136670804241134t28b93dddl80fd382224d0afa1@mail.gmail.com>
Message-ID: <87r6cv13mx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Voltz <john.voltz@gmail.com> writes:

 John> Makefile.autotools.in will use the first argument of call
 John> AUTOTARGETS, look around line 161. I've never used
 John> <pkg>_DIR_PREFIX in any of the makefiles I've created and it
 John> works in festival this way, even with the multiple
 John> sub-directories.

Ok, so why did you add it to classpath and jamvm?

-- 
Bye, Peter Korsgaard
