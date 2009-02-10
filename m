From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 13:37:59 +0100
Subject: [Buildroot] rebuilding with new option
In-Reply-To: <20090210112901.kwbh1totokgkwcc8@webmail.digibel.be>
	(steve@c2root.be's message of "Tue\,
	10 Feb 2009 11\:29\:01 +0100")
References: <20090210112901.kwbh1totokgkwcc8@webmail.digibel.be>
Message-ID: <87eiy65uxk.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "steve" == steve  <steve@c2root.be> writes:

 steve> Hi all,

 steve> I have noticed that when I change options after a build in the
 steve> toolchain, it does not recompile. I have added large file support
 steve> afterwards and still further down the build it is complaining I don't
 steve> have large file support. When I double check the config, it states
 steve> that it should have large file support.

That's a known issue. I will work on getting this to work more sanely
after the release. Until then your best bet after changing anything
toolchain related is rm -rf *build_*; make

-- 
Bye, Peter Korsgaard
