From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Oct 2008 16:38:18 +0200
Subject: [Buildroot] Busybox build fails with external toolchain
In-Reply-To: <20081023133045.GA956@mx.loc> (Bernhard Reutner-Fischer's message
	of "Thu\, 23 Oct 2008 15\:30\:45 +0200")
References: <c88e466f0810230239m298d6b09v92a11fdb4ce5f077@mail.gmail.com>
	<87y70fd4ig.fsf@macbook.be.48ers.dk> <20081023133045.GA956@mx.loc>
Message-ID: <87zlkvgyw5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,

 >> The external toolchain stuff is known to be kinda flaky - But maybe
 >> your problem is the ~ - Could you try with an absolute path to the
 >> external toolchain?

 Bernhard> '~' != $HOME unless

Indeed, that's what I thought. There might be other packages having
issues with ~ as well though, so better use the full path instead.

-- 
Bye, Peter Korsgaard
