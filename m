From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2008 20:21:07 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/java: classpath
	concierge jamvm
In-Reply-To: <46a136670804241111j3548905fn3ca6f80b56e92dcf@mail.gmail.com>
	(John Voltz's message of "Thu\, 24 Apr 2008 14\:11\:26 -0400")
References: <20080424164821.800223C7C2@busybox.net>
	<874p9r408c.fsf@macbook.be.48ers.dk>
	<46a136670804241111j3548905fn3ca6f80b56e92dcf@mail.gmail.com>
Message-ID: <87fxtb2jxo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Voltz <john.voltz@gmail.com> writes:

 John> I don't even see where JAMVM_DIR_PREFIX is being used at
 John> all. I'm removing it.

It seems to be used in Makfile.autotools.in ($(PKG)_DIR_PREFIX) for
finding the patches, so you better not.

Does it apply the avr32 patch if you leave it out?

-- 
Bye, Peter Korsgaard
